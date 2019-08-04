import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/values/styles.dart';
import 'package:flutter/material.dart';

class ForgotPassPage extends StatefulWidget {

  static const route = "/forgot-pass";

  @override
  _ForgotPassPageState createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends BaseState<ForgotPassPage> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _nodeEmail = FocusNode();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("FORGOT PASSWORD?",
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 8,),
                Text("A password reset instruction will be sent your email.",
                style: TextStyle(fontSize: 16),),
                SizedBox(height: 20),
                _buildForgotPassForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() => TextFormField(
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
    focusNode: _nodeEmail,
    onFieldSubmitted: (term) {
      _nodeEmail.unfocus();
    },
    decoration: InputDecoration(
        hintText: 'Enter email',
        hintStyle: normalText,
        labelText: 'Email',
        labelStyle: normalText,
        contentPadding: textFieldContentPadding,
        focusedBorder: focusBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder),
  );


  Widget _forgotPassBtn() => RaisedButton(
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    onPressed: () {
      //loginBtnDidTapped();
    },
    padding: EdgeInsets.all(16),
    color: Colors.blue,
    child: Text('SEND RESET EMAIL',
        style: TextStyle(color: Colors.white, fontSize: 16.0)),
  );


  Widget _buildForgotPassForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _emailField(),
            SizedBox(height: 40),
            _forgotPassBtn()
          ],
        ));
  }

}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}