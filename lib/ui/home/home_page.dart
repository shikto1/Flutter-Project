import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/ui/tabs/first_tab.dart';
import 'package:blockpatter/ui/tabs/second_tab.dart';
import 'package:blockpatter/ui/tabs/third_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  int _selectedIndex = 0;
  final tabs = [FirstTab(), SecondTab(), ThirdTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), title: Text("TopUp")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Account"))
          ]),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
