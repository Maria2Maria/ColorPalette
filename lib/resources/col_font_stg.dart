import 'package:flutter/material.dart';

const Color lightpurple= Color(0xFFECEDF3);
const Color purple= Color(0xFF4E59D3);
const Color favorite_offC=Color(0xFF979797);
const Color white=Colors.white;
const Color black=Colors.black;
const Color barriercolor=Color.fromRGBO(16, 16, 16,0.2);
const Color shadowcolor=Color.fromRGBO(0, 0, 0,0.15);
const Color lightgrey=Color(0xFFEFEFEF);
//RGB slider colors
const Color Sred=Color(0xFFF60909);
const Color Sgreen=Color(0xFF12F816);
const Color Sblue=Color(0xFF0508C9);
const Color inactivecolor=Color.fromRGBO(0, 0, 0,0.2);
const Color red=Colors.red;
const Color green=Colors.green;


//Palette theme rectangles
const wrec1=Color(0xFFB08957);
const wrec2=Color(0xFFEE9039);
const wrec3=Color(0xFFE7282E);
const wrec4=Color(0xFFD9213A);

const crec1=Color(0xFF4884E5);
const crec2=Color(0xFF0B1ACB);
const crec3=Color(0xFF3E55C4);
const crec4=Color(0xFF295DF4);

const drec1=Color(0xFF717171);
const drec2=Color(0xFF575757);
const drec3=Color(0xFF2D2D2D);
const drec4=Color(0xFF222222);

const brec1=Color(0xFFFFCC66);
const brec2=Color(0xFF8DD7BF);
const brec3=Color(0xFFFF96C5);
const brec4=Color(0xFFE77577);

const mrec1=Color(0xFF35DB8E);
const mrec2=Color(0xFF36D088);
const mrec3=Color(0xFF30C780);
const mrec4= Color(0xFF23945F);


String title1= "Palette size";
String title2= "Palette mode";
String generate="Generate";
String favorite="Favorite";
String sliderBlue="Blue";
String sliderRed="Red";
String sliderGreen="Green";
String sliderAlpha="Alpha";

String wtones="Warm tones";
String ctones="Cold tones";
String dtones="Dark tones";
String btones="Bright tones";
String mtones="Monochrome";

String ftype1="Roboto";
String ftype2="Cairo";

TextStyle tonesTextStyle(double size){
  return TextStyle(
      fontFamily: ftype1,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: white,
      fontSize: size);
}