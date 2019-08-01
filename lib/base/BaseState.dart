import 'package:blockpatter/base/BaseView.dart';
import 'package:blockpatter/utils/AlertService.dart';
import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> implements BaseView {

  AlertService mAlertService;
  BuildContext buildContext;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    mAlertService = AlertService();
    super.initState();
  }

  @override
  void onNetworkUnavailable() {
    mAlertService.showAlert(context, "No Internet Connection !", "Please check your internet connection and try again.");
  }

  @override
  void onNetworkCallStarted(String loadingMsg) {
    showToast("Started");
  }

  @override
  void onNetworkCallEnded() {
    showToast("Ended");
  }

  @override
  void onUserIsUnauthorized() {
    showToast("Unauthorized");
  }

  @override
  void onTimeOutError() {
    mAlertService.showAlert(context, "Time Out Errror", "We are having trouble to connect with server. Please try again later.");
  }

  @override
  void onServerError() {
    mAlertService.showAlert(context, "Server Error", "Could not connect with server. Please try agian later.");
  }

  void changeFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void showToast(String message){
    mAlertService.showToast(context, message);
  }

}
