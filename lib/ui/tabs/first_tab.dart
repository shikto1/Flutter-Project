import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),),
    );
  }
}
