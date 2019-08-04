import 'package:blockpatter/data/network/APIs.dart';
import 'package:blockpatter/base/BaseApiResponse.dart';
import 'package:blockpatter/data/network/ConnectivityUtils.dart';
import 'package:blockpatter/data/pref/Keys.dart';
import 'package:blockpatter/data/pref/PreferenceManager.dart';
import 'package:dio/dio.dart';
import 'package:blockpatter/base/BaseView.dart';

enum RequestMethod { GET, POST }

class DioUtils {

  static Dio _dio = Dio();

  static Future<BaseApiResponse> reqeust(String url, { method: RequestMethod.GET, FormData formData }) async {
    try {
      Response response;
      switch (method) {
        case RequestMethod.GET:
          response = await _getDio().get(url);
          break;
        case RequestMethod.POST:
          response = formData != null ? await _getDio().post(url, data: formData) : await _getDio().post(url);
          break;
      }
      return BaseApiResponse.onSuccess(response.data);
    } on DioError catch (error) {
      if(error.type == DioErrorType.RESPONSE &&  error.response.statusCode == 422){
        return BaseApiResponse.onFormDataError(error.response.data);
      }else{
        return BaseApiResponse.onDioError(error);
      }
    }
  }

  static Dio _getDio() {
    if (_dio == null) {
      _dio = Dio();
    }
    _addInterceptor();
    return _dio;
  }

  static _addInterceptor() {
    final int maxCharactersPerLine = 200;
    _dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
      if (!await ConnectivityUtils.sharedInstance.isConnectionAvailable()) {
        throw NoConnectivityException;
      } else {
        // Dio Configuration >>>>>>
        options.baseUrl = APIs.BASE_URL; // It can be empty....
        options.connectTimeout = 5000; //5s
        options.receiveTimeout = 5000; //5s

        // Attaching Access token with request from Shared Preference >>>>>>
        _dio.interceptors.requestLock.lock();
        String token = await PreferenceManager.sharedInstance.getString(Keys.ACCESS_TOKEN.toString());
        options.headers["Authorization"] = "Bearer $token";
        _dio.interceptors.requestLock.unlock();

        // Printing Log before Sending Request >>>>>>>
        print("--> ${options.method} ${options.baseUrl}${options.path}");
        print("Content type: ${options.contentType}");
        print("<-- END HTTP");
        return options;
      }
    }, onResponse: (Response response) {
      print(
          "<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
      String responseAsString = response.data.toString();
      if (responseAsString.length > maxCharactersPerLine) {
        int iterations =
            (responseAsString.length / maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
          if (endingIndex > responseAsString.length) {
            endingIndex = responseAsString.length;
          }
          print(responseAsString.substring(
              i * maxCharactersPerLine, endingIndex));
        }
      } else {
        print(response.data);
      }
      print("<-- END HTTP");
      return response;
    }, onError: (DioError error) {
      return error;
    }));
  }
}
