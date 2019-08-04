import 'package:flutter/material.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TopUp"),
      ),
      body: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Container(
          child: Center(
            child: Text("TopUp"),
          ),
        ),),
    );
  }
}
