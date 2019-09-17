import 'package:flutter/material.dart';
import 'package:blockpatter/values/colors.dart';
import 'package:blockpatter/helpers/HexColor.dart';

class AccountTab extends StatefulWidget {
  @override
  _AccountTabState createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {

  ImageProvider profileImg = AssetImage('assets/images/zk.jpg');

  @override
  Widget build(BuildContext context) {

    precacheImage(AssetImage("assets/images/zk.jpg"), context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: TextStyle(color: HexColor(colorPrimary))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: profileImg,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all( Radius.circular(60.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                  autocorrect: false,
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: 'Shikto Shishir',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                  )),
              SizedBox(height: 18),
              TextField(
                  autocorrect: false,
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: 'shishirthedev@gmail.com',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                  )),
              SizedBox(height: 18),
              TextField(
                  autocorrect: false,
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: '01784888919',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                  )),
              SizedBox(height: 18),
              TextField(
                  autocorrect: false,
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: 'Male',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                  )),
              SizedBox(height: 16),
              TextField(
                  autocorrect: false,
                  enableInteractiveSelection: false,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                    hintText: '31-12-1994',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withAlpha(40)),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
