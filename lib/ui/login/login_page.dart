import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/ui/forgot_pass/forgotpass_page.dart';
import 'package:blockpatter/ui/home/home_page.dart';
import 'package:blockpatter/ui/login/login_contract.dart';
import 'package:blockpatter/ui/registration/registeration_page.dart';
import 'package:flutter/material.dart';
import 'package:blockpatter/values/styles.dart';

class LoginPage extends StatefulWidget {
  static const route = "/login-page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage> implements LoginView {
  LoginPresenterImpl presenter;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _nodeEmail = FocusNode();
  final _nodePassword = FocusNode();

  bool _isObscureText = true;

  @override
  void initState() {
    presenter = LoginPresenterImpl(this);
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nodeEmail.dispose();
    _nodePassword.dispose();
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
                Text("USER LOGIN",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 24),
                _buildLoginForm()
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
        textInputAction: TextInputAction.next,
        focusNode: _nodeEmail,
        onFieldSubmitted: (term) {
          changeFocus(context, _nodeEmail, _nodePassword);
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

  Widget _passwordField() => TextFormField(
      controller: _passwordController,
      obscureText: _isObscureText,
      textInputAction: TextInputAction.done,
      focusNode: _nodePassword,
      onFieldSubmitted: (term) {
        _nodePassword.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Enter password',
        hintStyle: normalText,
        labelText: 'Password',
        labelStyle: normalText,
        contentPadding: textFieldContentPadding,
        focusedBorder: focusBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
          child: new Icon(
              _isObscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ));

  Widget _loginButton() => RaisedButton(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onPressed: () {
          loginBtnDidTapped();
        },
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text('LOGIN',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
      );

  Widget _registerButton() => OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        onPressed: () {
          Navigator.pushNamed(context, RegistrationPage.route);
        },
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text('REGISTER',
            style: TextStyle(color: Colors.blue, fontSize: 16.0)),
      );

  Widget _buildLoginForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _emailField(),
            SizedBox(height: 16),
            _passwordField(),
            SizedBox(height: 34),
            Row(
              children: <Widget>[
                Expanded(
                  child: _loginButton(),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _registerButton(),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Center(
                child: FlatButton(onPressed: (){
                  Navigator.pushNamed(context, ForgotPassPage.route);
                }, child: Text("Forgot Password ?",style: TextStyle(fontSize: 17, color: Colors.grey),)),
              ),
            )

          ],
        ));
  }

  @override
  void loginBtnDidTapped() {
    Navigator.pushNamed(context, HomePage.route);
//    final _form = _formKey.currentState;
//    if (_form.validate()) {
//      _form.save();
//      FocusScope.of(context).requestFocus(FocusNode());
//      presenter.doLogin("ss", "pp");
//    }
  }

  @override
  void loginDidFailed(String failedMsg) {
    print(failedMsg);
  }

  @override
  void loginDidSucceed() {
    showToast("Login Success");
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
