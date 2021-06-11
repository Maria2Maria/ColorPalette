import 'package:color_palette0/custom_icons_icons.dart';
import 'package:color_palette0/google_icons_icons.dart';
import 'package:color_palette0/screens/generate_palette_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemePaletteScreen extends StatefulWidget {
  @override
  _ThemePaletteScreenState createState() => _ThemePaletteScreenState();
}

class _ThemePaletteScreenState extends State<ThemePaletteScreen> {
  List listTones = [
    {"tone": "Warm tones", "path": "assets/SVG/warmTones.svg"},
    {"tone": "Cold tones", "path": "assets/SVG/coldTones.svg"},
    {"tone": "Dark tones", "path": "assets/SVG/darkTones.svg"},
    {"tone": "Bright tones", "path": "assets/SVG/brightTones.svg"},
    {"tone": "Monochronome", "path": "assets/SVG/monochrome.svg"},
  ];

  int size = 3;
  String type;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xECEDF3).withOpacity(1),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  width: w * 0.94,
                  height: h * 0.14,
                  child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",
                      fit: BoxFit.fill)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: h * 0.04,
                  width: w * 0.27,
                  margin: EdgeInsets.only(top: h * 0.06),
                  child: SvgPicture.asset(
                    "assets/SVG/myPalette.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: h * 0.17),
                  child: Text(
                    "Palette size",
                    style: TextStyle(
                        fontSize: h * 0.025,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: h * 0.22),
              padding: EdgeInsets.symmetric(horizontal: h * 0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: h*0.029,
                    backgroundColor: Color(0xA0A6E7).withOpacity(1.0),
                    child: IconButton(
                      icon: Icon(GoogleIcons.minus, color: Colors.black,size: w*0.045,),
                      onPressed: () {
                        if (size > 3)
                          setState(() {
                            size--;
                          });
                      },
                    ),
                  ),
                  /*Container(
                    color: Colors.red,
                    width: h * 0.06,
                    height: h * 0.06,
                    child: FlatButton(
                      color: Color(0xA0A6E7).withOpacity(1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        //color:Colors.red,
                        child: Center(
                          //height: 10,
                          //width: 10,
                          child: Text(
                            "o",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (size > 3)
                          setState(() {
                            size--;
                          });
                      },
                    ),
                  ),*/
                  Text(
                    "$size",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: h*0.037
                    ),
                  ),
                  CircleAvatar(
                    radius: h*0.029,
                    backgroundColor: Color(0xA0A6E7).withOpacity(1.0),
                    child: IconButton(
                      icon: Icon(GoogleIcons.plus, color: Colors.black,size: w*0.045,),
                      onPressed: () {
                        if (size < 6)
                          setState(() {
                            size++;
                          });
                      },
                    ),
                  ),
                  /*IconButton(
                    /*splashColor: Colors.white.withOpacity(0),
                    hoverColor: Colors.white.withOpacity(0),
                    disabledColor: Colors.white.withOpacity(0),
                    highlightColor: Colors.white.withOpacity(0),*/
                    icon: Container(
                      height: h * 0.06,
                      width: h * 0.06,
                      decoration: BoxDecoration(
                        color: Color(0xA0A6E7).withOpacity(1.0),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(
                          fontFamily: "Roboto",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: h*0.037),
                      )),
                    ),
                    onPressed: () {
                      if (size < 6)
                        setState(() {
                          size++;
                        });
                    },
                  ),*/
                  /*Container(
                    width: h * 0.06,
                    height: h * 0.06,
                    child: RaisedButton(
                      color: Color(0xA0A6E7).withOpacity(1.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      onPressed: () {
                        if (size < 6)
                          setState(() {
                            size++;
                          });
                      },
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                  width: w * 0.88,
                  height: h * 0.41,
                  child: SvgPicture.asset("assets/SVG/rectangleBas.svg",
                      fit: BoxFit.fill)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: h * 0.34),
                  child: Text(
                    "Palette mode",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.normal,
                        fontSize: h * 0.025,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: h * 0.39),
                  width: w * 0.864,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(children: [
                            Container(
                              height: h * 0.136,
                              width: w * 0.397,
                              decoration: BoxDecoration(
                                //color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xB08957).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Color(0xEE9039).withOpacity(1),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        color: Color(0xE7282E).withOpacity(1),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xD9213A).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    )),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    type = "Warm tones";
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.056, horizontal: w * 0.074),
                              child: Text(
                                "Warm tones",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: h * 0.02),
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: w * 0.07,
                          ),
                          Stack(children: [
                            Container(
                              height: h * 0.136,
                              width: w * 0.397,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    type = "Cold tones";
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x4884E5).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x0B1ACB).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x3E55C4).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x295DF4).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.056, horizontal: w * 0.088),
                              child: Text(
                                "Cold tones",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: h * 0.02),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Row(
                        children: [
                          Stack(children: [
                            Container(
                              height: h * 0.136,
                              width: w * 0.397,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    type = "Dark tones";
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x717171).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x575757).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x2D2D2D).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x222222).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.056, horizontal: w * 0.088),
                              child: Text(
                                "Dark tones",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: h * 0.02),
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: w * 0.07,
                          ),
                          Stack(children: [
                            Container(
                              height: h * 0.136,
                              width: w * 0.397,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    type = "Bright tones";
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFCC66).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x8DD7BF).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Color(0xFF96C5).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xE77577).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.056, horizontal: w * 0.074),
                              child: Text(
                                "Bright tones",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: h * 0.02),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.025,
                      ),
                      Row(
                        children: [
                          Stack(children: [
                            Container(
                              height: h * 0.136,
                              width: w * 0.397,
                              decoration: BoxDecoration(
                                color: Color(0xB08957).withOpacity(1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    type = "Monochrome";
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x35DB8E).withOpacity(1),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x36D088).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Color(0x30C780).withOpacity(1),
                                    )),
                                    Expanded(
                                        child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x23945F).withOpacity(1),
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.056, horizontal: w * 0.074),
                              child: Text(
                                "Monochrome",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: h * 0.02),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      /* GridView(
                        //don't make a gridview make every image in a container and margins its is better i think
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: w*0.397,
                            //maxCrossAxisExtent: 120,
                            //childAspectRatio: 3 / 2,
                            childAspectRatio: 149 / 111,
                            crossAxisSpacing: w*0.07,
                            mainAxisSpacing: h*0.025,
                          ),
                          children: [
                            ...listTones.map((val) {
                              return GestureDetector(
                                child: Container(
                                  // color: Colors.red,
                                  height: h*0.136,
                                  width: w*0.397,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  //child: SvgPicture.asset( "assets/SVG/warmTones.svg",fit: BoxFit.fill,),
                                  child: Row(
                                    children: [
                                      Expanded(child: Container(decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)),
                                      ),
                                      ),
                                      ),
                                      Expanded(child: Container(color: Colors.yellow,)),
                                      Expanded(child: Container(color: Colors.black,)),
                                      Expanded(child: Container(decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),)),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    type = val["tone"];
                                  });
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return GeneratePaletteScreen(size, type);
                                    }),
                                  );
                                },
                              );
                            }).toList(),
                          ]),*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
