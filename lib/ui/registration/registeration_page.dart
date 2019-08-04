import 'package:flutter/material.dart';
import 'package:blockpatter/values/styles.dart';
import 'package:blockpatter/base/BaseState.dart';

class RegistrationPage extends StatefulWidget {
  static const route = "/registration-page";

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends BaseState<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassController = TextEditingController();

  final _nodeName = FocusNode();
  final _nodeEmail = FocusNode();
  final _nodePhoneNumber = FocusNode();
  final _nodePassword = FocusNode();
  final _nodeConfirmPass = FocusNode();

  bool _isObscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();

    _nodeName.dispose();
    _nodeEmail.dispose();
    _nodePhoneNumber.dispose();
    _nodePassword.dispose();
    _nodeConfirmPass.dispose();
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
            margin: EdgeInsets.fromLTRB(34, 20, 34, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("REGISTRATION",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(height: 24),
                _buildRegistrationForm()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField() => TextFormField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _nodeName,
        onFieldSubmitted: (term) {
          changeFocus(context, _nodeName, _nodeEmail);
        },
        decoration: InputDecoration(
            hintText: 'Enter name',
            hintStyle: normalText,
            labelText: 'NAME',
            labelStyle: normalText,
            contentPadding: textFieldContentPadding,
            focusedBorder: focusBorder,
            enabledBorder: enabledBorder,
            errorBorder: errorBorder),
      );

  Widget _emailField() => TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _nodeEmail,
        onFieldSubmitted: (term) {
          changeFocus(context, _nodeEmail, _nodePhoneNumber);
        },
        decoration: InputDecoration(
            hintText: 'Enter email',
            hintStyle: normalText,
            labelText: 'EMAIL',
            labelStyle: normalText,
            contentPadding: textFieldContentPadding,
            focusedBorder: focusBorder,
            enabledBorder: enabledBorder,
            errorBorder: errorBorder),
      );

  Widget _phoneNumberField() => TextFormField(
        controller: _phoneNumberController,
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        focusNode: _nodePhoneNumber,
        onFieldSubmitted: (term) {
          changeFocus(context, _nodePhoneNumber, _nodePassword);
        },
        decoration: InputDecoration(
            hintText: 'Enter phone number',
            hintStyle: normalText,
            labelText: 'PHONE NUMBER',
            labelStyle: normalText,
            contentPadding: textFieldContentPadding,
            focusedBorder: focusBorder,
            enabledBorder: enabledBorder,
            errorBorder: errorBorder),
      );

  Widget _passwordField() => TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: _isObscureText,
      textInputAction: TextInputAction.next,
      focusNode: _nodePassword,
      onFieldSubmitted: (term) {
        changeFocus(context, _nodePassword, _nodeConfirmPass);
      },
      decoration: InputDecoration(
          hintText: 'Enter password',
          hintStyle: normalText,
          labelText: 'PASSWORD',
          labelStyle: normalText,
          focusedBorder: focusBorder,
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
          contentPadding: textFieldContentPadding
//        suffixIcon: new GestureDetector(
//          onTap: () {
//            setState(() {
//              _isObscureText = !_isObscureText;
//            });
//          },
//          child: new Icon(
//              _isObscureText ? Icons.visibility : Icons.visibility_off),
//        ),
          ));

  Widget _confirmPasswordField() => TextFormField(
      controller: _confirmPassController,
      keyboardType: TextInputType.text,
      obscureText: _isObscureText,
      textInputAction: TextInputAction.done,
      focusNode: _nodeConfirmPass,
      onFieldSubmitted: (term) {
        _nodePassword.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Retype Password',
        hintStyle: normalText,
        labelText: 'CONFIRM PASSWORD',
        labelStyle: normalText,
        focusedBorder: focusBorder,
        enabledBorder: enabledBorder,
        errorBorder: errorBorder,
        contentPadding: textFieldContentPadding,
//        suffixIcon: new GestureDetector(
//          onTap: () {
//            setState(() {
//              _isObscureText = !_isObscureText;
//            });
//          },
//          child: new Icon(
//              _isObscureText ? Icons.visibility : Icons.visibility_off),
//        ),
      ));

  Widget _registerButton() => RaisedButton(
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    onPressed: () {},
    padding: EdgeInsets.all(16),
    color: Colors.blue,
    child: Text('REGISTER',
        style: TextStyle(color: Colors.white, fontSize: 16.0)),
  );

  Widget _buildRegistrationForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _nameField(),
            SizedBox(height: 16),
            _emailField(),
            SizedBox(height: 16),
            _phoneNumberField(),
            SizedBox(height: 16),
            _passwordField(),
            SizedBox(height: 16),
            _confirmPasswordField(),
            SizedBox(height: 24),
            _registerButton(),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an Account ?",
                    style: TextStyle(fontSize: 16),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ))
                ],
              ),
            )
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
