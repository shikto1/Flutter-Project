import 'package:flutter/material.dart';

class ThirdTab extends StatefulWidget {
  @override
  _ThirdTabState createState() => _ThirdTabState();
}

class _ThirdTabState extends State<ThirdTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          child: Center(
            child: Text("Account"),
          ),
        ),),
    );
  }
}
