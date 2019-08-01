import 'package:connectivity/connectivity.dart';

class ConnectivityUtils {

  static ConnectivityUtils sharedInstance = ConnectivityUtils();

  Future<bool> isConnectionAvailable() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

}

class NoConnectivityException implements Exception{
    String get errorMessage => "No Internet Connection";
}