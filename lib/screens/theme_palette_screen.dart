import 'package:color_palette0/custom_icons_icons.dart';
import 'package:color_palette0/screens/generate_palette_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Color(0xECEDF3).withOpacity(1),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset("assets/SVG/rectangleHaut.svg"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top:h*0.067),
                  child: SvgPicture.asset("assets/SVG/myPalette.svg"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top:h*0.17),
                  child: Text(
                    "Palette size",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:h*0.22),
              padding: EdgeInsets.symmetric(horizontal: h*0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color:Color(0xA0A6E7).withOpacity(1.0),
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40),
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
                    style: TextStyle(fontSize: 40),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xA0A6E7).withOpacity(1.0),
                      shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        "+",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
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
              child: SvgPicture.asset("assets/SVG/rectangleBas.svg"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top:h*0.34),
                  child: Text(
                    "Palette mode",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  //padding: EdgeInsets.only(top: 300),
                  margin: EdgeInsets.only(top:h*0.39),
                  width: 340,
                  //color: Colors.red,
                  // height: 400,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 20,
                      ),
                      children: [
                        ...listTones.map((val) {
                          return GestureDetector(
                            child: SvgPicture.asset(val["path"]),
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
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
