import 'package:blockpatter/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:blockpatter/helpers/HexColor.dart';
import 'package:blockpatter/values/colors.dart';

class StartPage extends StatefulWidget {

  static const route = "/";

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    Widget _userLoginBtn() => RaisedButton(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.route);
          },
          padding: EdgeInsets.all(16),
          color: HexColor(colorPrimary),
          child: Text('USER',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        );

    Widget _merchantLoginBtn() => OutlineButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onPressed: () {
            Navigator.pushNamed(context, LoginPage.route);
          },
          padding: EdgeInsets.all(16),
          color: Colors.blue,
          child: Text('MERCHANT',
              style: TextStyle(color: HexColor(colorPrimary), fontSize: 16.0)),
        );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Center(
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(size: 110),
                  SizedBox(height: 180),
                  _userLoginBtn(),
                  SizedBox(height: 16),
                  _merchantLoginBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
