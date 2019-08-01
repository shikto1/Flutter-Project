import 'package:blockpatter/data/network/APIs.dart';
import 'package:blockpatter/data/network/ApiResponse.dart';
import 'package:blockpatter/data/network/ConnectivityUtils.dart';
import 'package:blockpatter/data/pref/Keys.dart';
import 'package:blockpatter/data/pref/PreferenceManager.dart';
import 'package:dio/dio.dart';
import 'package:blockpatter/base/BaseView.dart';


enum RequestMethod { GET, POST }

class DioHandler {

  static Dio _dio = Dio();

  static Future<BaseApiResponse> reqeust(url, { method: RequestMethod.GET, formData }) async {
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
      if (response.statusCode == 200) {
        return BaseApiResponse.onSuccess(response.data);
      } else {
        throw Exception("Interface Exception R");
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.DEFAULT && e.error == NoConnectivityException) {
        print("NO CONNECTION");
        //    if (mView != null) mView.onNetworkUnavailable();
      } else if (e.type == DioErrorType.RESPONSE) {
        Response _response = e.response;
        if (_response != null) {
          int _httpCode = _response.statusCode;
          print("HTTP CODE: $_httpCode");
          switch (_httpCode) {
            case 401:
              //        if (mView != null) mView.onUserIsUnauthorized();
              break;

            case 404:
              //      if (mView != null) mView.onServerError();
              break;

            case 422:
              //    onInvalidFormData(Map());
              break;

            case 500:
              //  if (mView != null) mView.onServerError();
              break;
          }
        }
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        //if (mView != null) mView.onTimeOutError();
      }
      return BaseApiResponse.onFromDataInvalid(Map());
    }
  }

  static Dio _getDio() {
    if (_dio == null) {
      _dio = Dio();
      _setUpInterceptor();
    }
    return _dio;
  }

  static _setUpInterceptor() {
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
        options.headers["Authorization"] = "Bearer $token}";
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
