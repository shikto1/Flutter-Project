import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

enum ConfirmAction { CANCEL, ACCEPT }

class AlertService {

  void showToast(BuildContext context, String msg) {
    Toast.show(
      msg,
      context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.BOTTOM,
      backgroundColor: Colors.black45,
    );
  }

  void showSnackBar(GlobalKey<ScaffoldState> _scaffoldKey, String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(seconds: 3),
    ));
  }

  Future<void> showAlert(
      BuildContext context, String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<ConfirmAction> showConfirmationAlert(
      BuildContext context, String title, String message,
      {String negativeBtnText = "CANCEL",
      String positiveBtnText = "ACCEPT"}) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(negativeBtnText),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: Text(positiveBtnText),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }
}
