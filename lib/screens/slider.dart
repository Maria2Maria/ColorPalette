import 'package:flutter/cupertino.dart';
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
        //contentPadding = EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      //backgroundColor: Color.fromRGBO(16, 16, 16,0.2),
        //contentPadding: EdgeInsets.all(0.0),
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
                        color: Colors.red,),
                    ),
                    Container(
                      //margin: EdgeInsets.only(top:h*0.01),
                      child: IconButton(icon: Icon(CustomIcons.validate,size: h*0.03,),color:Colors.green,
                        onPressed: () {
                        Color c = Color.fromRGBO( r.round(), g.round(), b.round(),a);
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
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        //spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        //color:Colors.red,
                        margin:EdgeInsets.only(left: h*0.02),
                        child: Text("Alpha",style: TextStyle(
                            fontFamily: 'Roboto',
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
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey.shade400,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          //spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin:EdgeInsets.only(left: h*0.02),
                            child: Text("Red",style: TextStyle(
                                fontFamily: 'Roboto',
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
                              activeColor: Color(0xF60909).withOpacity(1),
                              inactiveColor: Colors.grey.shade400,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          //spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin:EdgeInsets.only(left: h*0.02),
                            width: w*0.12,
                            height: h*0.025,
                            child: Text("Green",style: TextStyle(
                                fontFamily: 'Roboto',
                                fontStyle: FontStyle.normal,
                                fontSize: h*0.02,
                                fontWeight: FontWeight.w400),
                            )),
                        Expanded(
                          child: Slider(
                              value: g,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Color(0x12F816).withOpacity(1),
                              inactiveColor: Colors.grey.shade400,
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
                    //margin: EdgeInsets.symmetric(horizontal: 10),
                    width: w*0.68,
                    height: h*0.056,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          //spreadRadius: 5,
                          blurRadius: 7,
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
                            child: Text("Blue",style: TextStyle(
                                fontFamily: 'Roboto',
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
                              activeColor: Color(0x0508C9).withOpacity(1),
                              inactiveColor: Colors.grey.shade400,
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
/*class RgbPickerState extends State<RgbPicker> {
  RgbPickerState({this.r, this.g, this.b});

  double r, g, b;
  double S=0.0;

  @override
  Widget build(BuildContext context) {
    BoxDecoration box = BoxDecoration(
      color: Color.fromARGB(255, r.round(), g.round(), b.round()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("slider"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                contentPadding:  EdgeInsets.all(0.0),
                content:  IntrinsicWidth(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                         ClipRect(
                            child:  Container(
                                width: 50.0, height: 180.0, decoration: box)),
                         Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0)),
                        Slider(
                            value: r,
                            min: 0.0,
                            max: 255.0,
                            activeColor: Colors.red[400],
                            onChanged: (double value) {
                              setState(() {
                                //config.r = r;
                                r = value;
                              });
                            }),
                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                        Slider(
                            value: g,
                            min: 0.0,
                            max: 255.0,
                            activeColor: Colors.green[400],
                            onChanged: (double value) {
                              setState(() {
                                //config.g = g;
                                g = value;
                              });
                            }),
                        Padding(
                            padding:
                               EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0)),
                         Slider(
                            value: b,
                            min: 0.0,
                            max: 255.0,
                            activeColor: Colors.blue[400],
                            onChanged: (double value) {
                              setState(() {
                                //config.b = b;
                                b = value;
                              });
                            }),
                      ]),
                ),
                actions: <Widget>[
                   FlatButton(
                      onPressed: () {
                        Color c =  Color.fromARGB(
                            255, r.round(), g.round(), b.round());
                        Navigator.pop(context, c);
                      },
                      child:  Text('Select'))
                ]);
          },
        );
      }),
      body: Column(
        children: [
          Text("$S",style: TextStyle(fontSize: 40),),
          Slider(
              value: S,
              min: 0.0,
              max: 255.0,
              activeColor: Colors.green[400],
              onChanged: (double val) {
                setState(() {
                  S = val;
                });
              }),
        ]
      ),
    );
  }
}*/

