import 'package:blockpatter/base/BaseView.dart';
import 'package:blockpatter/data/network/ConnectivityUtils.dart';
import 'package:blockpatter/data/pref/Keys.dart';
import 'package:blockpatter/data/pref/PreferenceManager.dart';
import 'package:dio/dio.dart';

//enum RequestMethod { GET, POST, PUT }

class DioUtils<V extends BaseView> {
  Dio _dio;
  V mView;

  Dio getInstance() {
    if (_dio == null) {
      _dio = Dio();
      setUpInterceptor();
    }
    return _dio;
  }

  setUpInterceptor() {
    final int maxCharactersPerLine = 200;
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (!await ConnectivityUtils.sharedInstance.isConnectionAvailable()) {
        throw NoConnectivityException;
      } else {
        // Dio Configuration >>>>>>
        //  options.baseUrl = "http://www.mocky.io"; // It can be empty....
        options.connectTimeout = 5000; //5s
        options.receiveTimeout = 3000; //3s

        // Attaching Access token with request from Shared Preference >>>>>>
        _dio.interceptors.requestLock.lock();
        String token = await PreferenceManager.sharedInstance
            .getString(Keys.ACCESS_TOKEN.toString());
        options.headers["token"] = "Bearer $token}";
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

//  Future<Response> post(String url) async {
//    return await getInstance().post(url);
//  }
//
//  Future<Response> get(String url) async {
//    return await getInstance().get(url);
//  }
//
//  void put() {}
}
