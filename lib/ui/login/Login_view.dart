import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/ui/login/Login_contract.dart';
import 'package:flutter/material.dart';
import 'package:blockpatter/utils/style.dart';


class LoginPage extends StatefulWidget {

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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(40),
            child: Center(
              child: _buildLoginForm(),
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
            contentPadding: edgeInsets,
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
        contentPadding: edgeInsets,
        focusedBorder: focusBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _isObscureText = !_isObscureText;
            });
          },
          child: new Icon(_isObscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ));

  Widget _loginButton() => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
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
        ),
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
            SizedBox(height: 24),
            _loginButton()
          ],
        ));
  }

  @override
  void loginBtnDidTapped() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      FocusScope.of(context).requestFocus(FocusNode());
      presenter.doLogin("ss", "pp");
    }
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
