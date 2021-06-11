import 'package:color_palette0/google_icons_icons.dart';
import 'package:color_palette0/resources/col_font_stg.dart';
import 'package:color_palette0/screens/generate_palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemePaletteScreen extends StatefulWidget {
  @override
  _ThemePaletteScreenState createState() => _ThemePaletteScreenState();
}

class _ThemePaletteScreenState extends State<ThemePaletteScreen> {
  int size = 3;
  String type;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightpurple,
      body: Stack(
        children: [
          Container(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
              width: w * 0.94,
              height: h * 0.14,
              child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",
                  fit: BoxFit.fill),
            ),
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
                  title1,
                  style: TextStyle(
                      fontSize: h * 0.025,
                      fontFamily: ftype1,
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
                  radius: h * 0.029,
                  backgroundColor: Color(0xA0A6E7).withOpacity(1.0),
                  child: IconButton(
                    icon: Icon(
                      GoogleIcons.minus,
                      color: black,
                      size: w * 0.045,
                    ),
                    onPressed: () {
                      if (size > 3)
                        setState(() {
                          size--;
                        });
                    },
                  ),
                ),

                Text(
                  "$size",
                  style: TextStyle(
                      fontFamily: ftype1,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: h * 0.037),
                ),
                CircleAvatar(
                  radius: h * 0.029,
                  backgroundColor: Color(0xA0A6E7).withOpacity(1.0),
                  child: IconButton(
                    icon: Icon(
                      GoogleIcons.plus,
                      color:black,
                      size: w * 0.045,
                    ),
                    onPressed: () {
                      if (size < 6)
                        setState(() {
                          size++;
                        });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
              width: w * 0.88,
              height: h * 0.41,
              child: SvgPicture.asset("assets/SVG/rectangleBas.svg",
                  fit: BoxFit.fill),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.only(top: h * 0.34),
                child: Text(
                  title2,
                  style: TextStyle(
                      fontFamily: ftype1,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowcolor,
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
                                        color: wrec1,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: wrec2,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: wrec3,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: wrec4,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  type = wtones;
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
                              wtones,
                              style: tonesTextStyle(h*0.02),
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
                                  color: shadowcolor,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  type = ctones;
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
                                        color: crec1,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: crec2,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: crec3,
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: crec4,
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
                              ctones,
                              style: tonesTextStyle(h*0.02),
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
                                  color: shadowcolor,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  type = dtones;
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
                                        color: drec1,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    color: drec2,
                                  )),
                                  Expanded(
                                    child: Container(
                                      color: drec3,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: drec4,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.056, horizontal: w * 0.088),
                            child: Text(
                              dtones,
                              style: tonesTextStyle(h*0.02),
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
                                  color: shadowcolor,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  type = btones;
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
                                        color: brec1,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    color: brec2,
                                  )),
                                  Expanded(
                                      child: Container(
                                    color: brec3,
                                  )),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: brec4,
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
                              btones,
                              style: tonesTextStyle(h*0.02),
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
                              //color: Color(0xFFB08957).withOpacity(1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowcolor,
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
                                  type = mtones;
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
                                        color: mrec1,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    color: mrec2,
                                  )),
                                  Expanded(
                                      child: Container(
                                    color: mrec3,
                                  )),
                                  Expanded(
                                      child: Container(
                                    decoration: BoxDecoration(
                                      color: mrec4,
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
                              mtones,
                              style: tonesTextStyle(h*0.02),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
