import 'package:flutter/material.dart';

import '../custom_icons_icons.dart';

class MySlider extends StatefulWidget {
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  Color C=Colors.red;
  @override
  Widget build(BuildContext context) {

    RgbPicker p = RgbPicker(
      r: 33.0,
      g: 66.0,
      b: 99.0,
      a:1.0,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("slider"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog<Color>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return p;
            }).then((Color c) {
          if (c != null) {
            setState(() {
              C=c;
            });
            print("RED");
            print(C.red);
            print("GREEN");
            print(c.green);
            print("BLUE");
            print(c.blue);
          }
        });
      }),
      body: Center(
        child: Text(
          "Hello",
          style: TextStyle(
            fontSize: 40,
            color: C,
          ),
        ),
      ),
    );
  }
}

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
    return AlertDialog(

      //backgroundColor: Color.fromRGBO(16, 16, 16,0.2),
        contentPadding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),

        content: IntrinsicWidth(
          child:Stack (
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(icon: Icon(Icons.clear,size: 40,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.red,),
                    IconButton(icon: Icon(CustomIcons.validate),color:Colors.green,
                      onPressed: () {
                      Color c = Color.fromRGBO( r.round(), g.round(), b.round(),a);
                      Navigator.pop(context, c);
                    },),
                ],),
                Positioned(
                  top:-50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(r.round(),g.round(),b.round(),a),
                        borderRadius: BorderRadius.circular(10)

                    ),
                    height: 100,
                    width: 100,
                  ),
                ),

                SliderTheme(
                  data:SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius:7),
                  ),
                  child: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  SizedBox(height: 40,),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0)),
                  Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 50.0,
                  height: 40,
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
                        child: Text("Alpha"),
                        width: 45,
                        height: 30,),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 50.0,
                    height: 40,
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
                            child: Text("Red"),
                        width: 45,
                        height: 30,),
                        Expanded(
                          child: Slider(
                              value: r,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Colors.red,
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
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 50.0, height: 40,
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
                            width: 45,
                            height: 30,
                            child: Text("Green")),
                        Expanded(
                          child: Slider(
                              value: g,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Colors.green,
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
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 50.0, height: 40,
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
                        Container(width: 45,
                            height: 30,
                            child: Text("Blue")),
                        Expanded(
                          child: Slider(
                              value: b,
                              min: 0.0,
                              max: 255.0,
                              activeColor: Colors.blue,
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
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0)),
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

