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
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
     /* appBar: AppBar(
        title: Text("Theme screen"),
      ),*/
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
                padding: EdgeInsets.only(top:50),
                child: SvgPicture.asset("assets/SVG/myPalette.svg"),

              ),
            ],
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Container(
                   padding: EdgeInsets.only(top: 150),
                   child: Text(
                      "Palette size",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                 ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 200),
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    onPressed: () {
                      if (size > 3)
                        setState(() {
                          size--;
                        });
                    },
                    child: SvgPicture.asset(
                      "assets/SVG/minus.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  //IconButton(icon: Icon(), onPressed: onPressed)
                  Text(
                    "$size",
                    style: TextStyle(fontSize: 40),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (size < 6)
                        setState(() {
                          size++;
                        });
                    },
                    child: SvgPicture.asset(
                      "assets/SVG/add.svg",
                      fit: BoxFit.cover,
                    ),
                  )
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
                  //color: Colors.red,
                  padding: EdgeInsets.only(top: 260),
                 // margin: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    "Palette mode",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 300),
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
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return GeneratePaletteScreen(size, type);
                                }),
                                );
                              },
                            );
                          }).toList(),
                        ]
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
