import 'package:device_info/device_info.dart';
import 'package:package_info/package_info.dart';
import 'dart:io' show Platform;

enum _Platform { Android, iOS, Others }

class AppUtils {

  static AppUtils sharedInstance = AppUtils();

  ////// >>>>>>>>>>>>>>>>>> DEVICE INFO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  _Platform getPlatFrom() {
    if (Platform.isAndroid) {
      return _Platform.Android;
    } else if (Platform.isIOS) {
      return _Platform.iOS;
    } else {
      return _Platform.Others;
    }
  }

  Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    } else {
      return "";
    }
  }
  // >>>>>>>>>>>>>>>>>>>>>>>>> PACKAGE INFO >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Future<String> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  Future<String> getAppName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.appName;
  }

  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getBuildNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

//  void rateTheApp() {}
//
//  void shareTheApp() {}
}
