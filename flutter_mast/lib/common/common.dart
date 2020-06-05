import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const String host = "http://api.theoxao.com/api";

BaseOptions get getOption {
  Map<String, dynamic> headers = Map();
  headers['token'] = "70843bc3-794a-4d99-a05a-c4e6487036bd";
  var _options = BaseOptions(headers: headers);
  return _options;
}

String currentState;

MaterialColor get primaryColor {
  return Colors.blue;
}

double get largerTextSize => 20;

double get primaryTextSize => 18;

double get secondTextSize => 16;

double get thirdTextSize => 14;

TextStyle get linkStyle => TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: primaryTextSize,
    color: Colors.black45,
    decoration: TextDecoration.none);

TextStyle get largererText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22,
    color: Colors.black,
    decoration: TextDecoration.none);


TextStyle get largerText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: largerTextSize,
    color: Colors.black,
    decoration: TextDecoration.none);

TextStyle get primaryText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: primaryTextSize,
    color: Colors.black,
    decoration: TextDecoration.none);

TextStyle get secondText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: primaryTextSize,
    color: Colors.black54,
    decoration: TextDecoration.none);


TextStyle get largerWhiteText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: largerTextSize,
    color: Colors.white,
    decoration: TextDecoration.none);

TextStyle get largererWhiteText => TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 22,
    color: Colors.white,
    decoration: TextDecoration.none);



Widget get loading  => Container(
  child: Center(
    child: CircularProgressIndicator(),
  ),
);
