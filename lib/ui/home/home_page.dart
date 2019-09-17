import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/ui/tabs/payment_tab.dart';
import 'package:blockpatter/ui/tabs/topup_tab.dart';
import 'package:blockpatter/ui/tabs/account_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const route = "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  int _currentIndex = 0;
  final _tabs = [PaymentTab(), TopUpTab(), AccountTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
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
      _currentIndex = index;
    });
  }
}
