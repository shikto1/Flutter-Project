import 'package:blockpatter/helpers/HexColor.dart';
import 'package:blockpatter/ui/forgot_pass/forgotpass_page.dart';
import 'package:blockpatter/ui/home/home_page.dart';
import 'package:blockpatter/ui/start/start_page.dart';
import 'package:blockpatter/ui/login/login_page.dart';
import 'package:blockpatter/ui/registration/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blockpatter/values/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Changing StatusBar Color..................
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.grey));

    // Crating Material App......................
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: HexColor(colorPrimary),
        primaryColorDark: HexColor(colorPrimaryDark)
      ),
      initialRoute: StartPage.route, // Use Initial Route or Home. Not both
      routes: {
        StartPage.route: (context) => StartPage(),
        LoginPage.route: (context) => LoginPage(),
        RegistrationPage.route: (context) => RegistrationPage(),
        ForgotPassPage.route: (context) => ForgotPassPage(),
        HomePage.route: (context) => HomePage()
      },
    );
  }
}
