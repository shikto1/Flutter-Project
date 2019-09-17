import 'package:flutter/material.dart';
import 'package:blockpatter/values/colors.dart';
import 'package:blockpatter/helpers/HexColor.dart';

class PaymentTab extends StatefulWidget {
  @override
  _PaymentTabState createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {

  ImageProvider scanQrCodeImg = AssetImage("assets/images/qr.jpg");

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/qr.jpg"), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(color: HexColor(colorPrimary)),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/images/qr.jpg"),
                  width: MediaQuery.of(context).size.width - 120,
                  height: MediaQuery.of(context).size.width - 120,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width - 120 ,
                  elevation: 1,
                  padding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                child: Text("SCAN TO PAY",style: TextStyle(color: Colors.white, fontSize: 16),),
                color: HexColor(colorPrimary),onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
