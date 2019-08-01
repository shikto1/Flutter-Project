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
    mAlertService.showToast(context, "No Internet Connection !");
  }

  @override
  void onNetworkCallStarted(String loadingMsg) {
    mAlertService.showToast(context, "Started");
  }

  @override
  void onNetworkCallEnded() {
    mAlertService.showToast(context, "Ended");
  }

  @override
  void onUserIsUnauthorized() {
    mAlertService.showToast(context, "Unauthorized");
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

}
