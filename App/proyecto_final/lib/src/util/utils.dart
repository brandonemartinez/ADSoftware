import 'package:flutter/material.dart';

String? state = null;
String? city = null;
var signedIn = false;
var rol = 'Cliente';
Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};
var primaryColor = Color(0xff243a69);
MaterialColor primaryMaterialColor = MaterialColor(0xff243a69, color);
var secondaryColor = Color(0xffff9800);
var backgroundColor = Color(0xffe9f2f9);
var userName = 'Pablo Martinez';
final border = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.transparent,
    width: 2.0,
  ),
  borderRadius: borderRadius,
);
var borderRadius = BorderRadius.circular(25.0);