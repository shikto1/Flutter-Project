import 'package:blockpatter/helpers/HexColor.dart';
import 'package:flutter/material.dart';


final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
    borderSide: BorderSide(width: 1, color: Colors.black));


final focusBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 0.5, color: Colors.blue),
);


final enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(4)),
  borderSide: BorderSide(width: 1, color: HexColor('F5F5F5')),
);


final textFieldContentPadding = EdgeInsets.fromLTRB(12.0, 14.0, 16.0, 14.0);

// TEXT STYLE ...........................................
final TextStyle xxLargeText = TextStyle(fontSize: 24.0);
final TextStyle xLargeText = TextStyle(fontSize: 20.0);
final TextStyle largeText = TextStyle(fontSize: 18.0);
final TextStyle normalText = TextStyle(fontSize: 16.0);
final TextStyle mediumText = TextStyle(fontSize: 14.0);
final TextStyle smallText = TextStyle(fontSize: 12.0);
final TextStyle xSmallText = TextStyle(fontSize: 10.0);
final TextStyle xxSmallText = TextStyle(fontSize: 8.0);
