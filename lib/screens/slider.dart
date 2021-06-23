import 'package:color_palette0/resources/col_font_stg.dart';
import 'package:flutter/material.dart';

import '../custom_icons_icons.dart';


class RgbPicker extends StatefulWidget {
  RgbPicker({this.r, this.g, this.b,this.a});

  double r, g, b,a;

  @override
  RgbPickerState createState() => RgbPickerState(r: r, g: g, b: b,a:a);
}

class RgbPickerState extends State<RgbPicker> {
  RgbPickerState({this.r, this.g, this.b,this.a});

  double r, g, b,a;

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return AlertDialog(
      contentPadding:EdgeInsets.symmetric(horizontal: w*0.07) ,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(h*0.0367),
        ),

        content: IntrinsicWidth(
          child:Stack (
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //margin: EdgeInsets.only(top:h*0.01),
                      child: IconButton(icon: Icon(Icons.clear,size: h*0.045,),
                        //constraints: BoxConstraints(maxHeight: h*0.055),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: red,),
                    ),
                    Container(
                      child: IconButton(icon: Icon(CustomIcons.validate,size: h*0.03,),color: green,
                        onPressed: () {
                        Color c = Color.fromRGBO( r.round(), g.round(), b.round(),a);
                        print("alpha=${c.opacity}");
                        Navigator.pop(context, c);
                      },),
                    ),
                ],),
                Positioned(
                  top:-h*0.076,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(r.round(),g.round(),b.round(),a),
                        borderRadius: BorderRadius.circular(h*0.0246)

                    ),
                    height: h*0.15,
                    width:h*0.15,
                  ),
                ),
                SliderTheme(
                  data:SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius:h*0.007),
                    trackHeight: 2,
                  ),
                  child: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Container(
                  margin: EdgeInsets.only(top: h*0.11),
                  width: w*0.83,
                  height: h*0.056,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: shadowcolor,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(

                        margin:EdgeInsets.only(left: h*0.02),
                        child: Text(sliderAlpha,style: TextStyle(
                            fontFamily: ftype1,
                            fontStyle: FontStyle.normal,
                            fontSize: h*0.02,
                            fontWeight: FontWeight.w400),

                        ),
                        width: w*0.11,
                        height: h*0.025,
                      ),
                      Expanded(
                        child: Slider(
                            value: a,
                            min: 0.0,
                            max: 1.0,
                            activeColor: black,
                            inactiveColor: inactivecolor,
                            onChanged: (double value) {
                              setState(() {
                                a = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                  Container(
                    margin: EdgeInsets.only(top: h*0.03),
                    width: w*0.68,
                    height: h*0.056,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: shadowcolor,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin:EdgeInsets.only(left: h*0.02),
                            child: Text(sliderRed,style: TextStyle(
                                fontFamily: ftype1,
                                fontStyle: FontStyle.normal,
                                fontSize: h*0.02,
                                fontWeight: FontWeight.w400),
                            ),
                          width: w*0.11,
                          height: h*0.025,
                        ),
                        Expanded(
                          child: Slider(
                              value: r,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Sred,
                              inactiveColor: inactivecolor,
                              onChanged: (double value) {
                                setState(() {
                                  r = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: h*0.03),
                    width: w*0.68,
                    height: h*0.056,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: shadowcolor,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin:EdgeInsets.only(left: h*0.02),
                            width: w*0.12,
                            height: h*0.025,
                            child: Text(sliderGreen,style: TextStyle(
                                fontFamily:ftype1 ,
                                fontStyle: FontStyle.normal,
                                fontSize: h*0.02,
                                fontWeight: FontWeight.w400),
                            ),
                        ),
                        Expanded(
                          child: Slider(
                              value: g,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Sgreen,
                              inactiveColor: inactivecolor,
                              onChanged: (double value) {
                                setState(() {
                                  g = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: h*0.03)),
                  Container(
                    width: w*0.68,
                    height: h*0.056,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: shadowcolor,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin:EdgeInsets.only(left: h*0.02),
                            width: w*0.11,
                            height: h*0.025,
                            child: Text(sliderBlue,style: TextStyle(
                                fontFamily: ftype1,
                                fontStyle: FontStyle.normal,
                                fontSize: h*0.02,
                                fontWeight: FontWeight.w400),
                            ),
                        ),
                        Expanded(
                          child: Slider(
                              value: b,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Sblue,
                              inactiveColor: inactivecolor,
                              onChanged: (double value) {
                                setState(() {
                                  b = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top:0.046*h)),
              ]),
                ),
              ])
        ),
    );
  }
}
