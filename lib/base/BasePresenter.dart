import 'package:blockpatter/base/BaseView.dart';
import 'package:blockpatter/data/network/ConnectivityUtils.dart';
import 'package:dio/dio.dart';

abstract class BasePresenter<V extends BaseView> {

  V mView;

  BasePresenter(V mView) {
    this.mView = mView;
  }

  void handleError(DioError e) {
    // print("Error Type: ${e.type} Error: ${e.error}");
    if (e.type == DioErrorType.DEFAULT && e.error == NoConnectivityException) {
      if (mView != null) mView.onNetworkUnavailable();
    } else if (e.type == DioErrorType.RESPONSE ) {
      Response _response = e.response;
      if (_response != null) {
        int _httpCode = _response.statusCode;

        switch (_httpCode) {
          case 401:
            if (mView != null) mView.onUserIsUnauthorized();
            break;

          case 404:
            if (mView != null) mView.onServerError();
            break;

          case 500:
            if (mView != null) mView.onServerError();
            break;
        }
      }
    } else if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT) {
         if (mView != null) mView.onTimeOutError();
    }
  }
}
