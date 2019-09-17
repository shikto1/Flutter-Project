import 'package:blockpatter/base/BaseState.dart';
import 'package:blockpatter/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:blockpatter/values/colors.dart';
import 'package:blockpatter/helpers/HexColor.dart';

class TopUpTab extends StatefulWidget {
  @override
  _TopUpTabState createState() => _TopUpTabState();
}

class _TopUpTabState extends BaseState<TopUpTab> {

  final _formKey = GlobalKey<FormState>();

  final _topUpNumberController = TextEditingController();
  final _amountController = TextEditingController();

  final _nodeTopUpNumber = FocusNode();
  final _nodeAmount = FocusNode();

   int _radioValue = 0;
   int _topUpType = 0;

  @override
  void dispose() {
    _topUpNumberController.dispose();
    _amountController.dispose();
    _nodeTopUpNumber.dispose();
    _nodeAmount.dispose();
    super.dispose();
  }

  void _handleRadioValueChanged(int value){
    setState(() {
      _topUpType = value;
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BoxDecoration _buildBalanceDecoration = BoxDecoration(
        color: HexColor(colorPrimary), borderRadius: BorderRadius.circular(3));

    final BoxDecoration _buildAddBalanceDecoration = BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(3));

    final _buildBalanceSection = Container(
      decoration: _buildBalanceDecoration,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Your Balance",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  Text("111.00",
                      style: TextStyle(fontSize: 24, color: Colors.white))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 10),
              decoration: _buildAddBalanceDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white, size: 28),
                  Text(
                    "Add Balance",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

    final _topUpNumberField = TextFormField(
      controller: _topUpNumberController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      focusNode: _nodeTopUpNumber,
      onFieldSubmitted: (term) {
        changeFocus(context, _nodeTopUpNumber, _nodeAmount);
      },
      decoration: InputDecoration(
          hintText: 'Enter Number',
          hintStyle: normalText,
          labelText: 'TopUp Number',
          labelStyle: normalText,
          contentPadding: textFieldContentPadding,
          focusedBorder: focusBorder,
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
          suffixIcon: IconButton(icon: Icon(Icons.contacts), onPressed: () {})),
    );

    final _amountField = TextFormField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        focusNode: _nodeAmount,
        onFieldSubmitted: (term) {
          _nodeAmount.unfocus();
        },
        decoration: InputDecoration(
          hintText: 'Enter amount',
          hintStyle: normalText,
          labelText: 'Amount',
          labelStyle: normalText,
          contentPadding: textFieldContentPadding,
          focusedBorder: focusBorder,
          enabledBorder: enabledBorder,
          errorBorder: errorBorder,
        ));

    final _topUpButton = RaisedButton(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: () {},
      padding: EdgeInsets.all(16),
      color: HexColor(colorPrimary),
      child:
          Text('TOPUP', style: TextStyle(color: Colors.white, fontSize: 16.0)),
    );

    Widget _buildTopUpSection() {
      return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _topUpNumberField,
              SizedBox(height: 16),
              _amountField,
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: _handleRadioValueChanged,activeColor: HexColor(colorPrimary)),
                  Text("Prepaid",style: TextStyle(fontSize: 18)),
                  Radio(value: 1, groupValue: _radioValue, onChanged: _handleRadioValueChanged,activeColor: HexColor(colorPrimary)),
                  Text("Postpaid", style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height: 40),
              _topUpButton
            ],
          ));
    }

    return Scaffold(
      appBar: AppBar(
      //  automaticallyImplyLeading: false,
        title: Text("TopUp", style: TextStyle(color: HexColor(colorPrimary))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: <Widget>[
                _buildBalanceSection,
                SizedBox(height: 30),
                _buildTopUpSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
