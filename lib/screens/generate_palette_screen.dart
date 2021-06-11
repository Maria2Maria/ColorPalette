import 'dart:core';

import 'package:color_palette0/custom_icons_icons.dart';
import 'package:color_palette0/google_icons_icons.dart';
import 'package:color_palette0/resources/col_font_stg.dart';
import 'package:color_palette0/screens/favorite_palette_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../palette.dart';
import 'dart:math' as math;
import 'package:toast/toast.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:color_palette0/screens/slider.dart';

import 'package:provider/provider.dart';


class GeneratePaletteScreen extends StatefulWidget {
  int size;
  String type;

  GeneratePaletteScreen(this.size, this.type);

  @override
  _GeneratePaletteScreenState createState() =>
      _GeneratePaletteScreenState(size, type);
}

class _GeneratePaletteScreenState extends State<GeneratePaletteScreen> {
  _GeneratePaletteScreenState(this.size, this.type);

  int size;
  String type;
  bool isLocked = false;
  bool isSelected = true;
  bool isfavorite=false;
  var SelectList = [];
  var listColor = [];
  var lockList = [];
  int selectedColor;

  void getindex(int c) {
    selectedColor = c;
  }

  @override
  void initState() {
    // TODO: implement initState
    listColor = initialisePalette(size, type);
    if (SelectList.isEmpty) {
      for (int i = 0; i < size; i++) {
        SelectList.add(false);
        lockList.add(false);
      }
      selectedColor = listColor[0];
      SelectList[0] = true;
    }
  }


  String componentToHex(int c) {
    var hex = c.toRadixString(16);
    return hex.length == 1 ? "0" + hex : hex;
  }

  List initialisePalette(int n, String types) {
    List L = [];
    int R;
    int G;
    int B;
    String color;
    int intColor;
    if (types == wtones) {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == ctones) {
      for (int i = 0; i < n; i++) {
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == dtones) {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(128);
        G = math.Random().nextInt(128);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == btones) {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(129) + 128;
        G = math.Random().nextInt(129) + 128;
        B = math.Random().nextInt(129) + 128;
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == mtones) {
      Color rcolor = Color(math.Random().nextInt(0xFFFFFF));
      List Ls = RandomListShades(n);
      String color;
      int intColor;
      MaterialColor matColor = getMaterialColor(rcolor, size);
      for (int i = 0; i < size; i++) {
        int S = Ls[i];
        R = matColor[S].red;
        G = matColor[S].green;
        B = matColor[S].blue;
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    }

    return L;
  }

  void generateWarmColors(int n) {
    List L = listColor.toList();
    int R;
    int G;
    int B;
    String color;
    int intColor;
    for (int i = 0; i < n; i++) {
      if (lockList[i] == false) {
        R = math.Random().nextInt(256 - 128) + 128;//sure
        G = math.Random().nextInt(256);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L[i] = intColor;
      }
      setState(() {
        listColor = L;
      });
      if(SelectList[i])selectedColor=listColor[i];
    }
  }

  void generateCoolColors(int n) {
    List L = listColor.toList();
    int R;
    int G;
    int B;
    String color;
    int intColor;
    for (int i = 0; i < n; i++) {
      if (lockList[i] == false) {

        R = math.Random().nextInt(129);
        G = (math.Random().nextInt(256));
        B = math.Random().nextInt(256 - 128) + 128;//ok

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L[i] = intColor;
      }

      setState(() {
        listColor = L;
      });
      if(SelectList[i])selectedColor=listColor[i];
    }
  }

  void generateDarkColors(int n) {
    List L = listColor.toList();
    int R;
    int G;
    int B;
    String color;
    int intColor;
    for (int i = 0; i < n; i++) {
      if (lockList[i] == false) {
        R = math.Random().nextInt(128);
        G = math.Random().nextInt(128);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L[i] = intColor;
      }

      setState(() {
        listColor = L;
      });
      if(SelectList[i])selectedColor=listColor[i];
    }
  }

  void generateBrightColors(int n) {
    List L = listColor.toList();
    int R;
    int G;
    int B;
    String color;
    int intColor;
    for (int i = 0; i < n; i++) {
      if (lockList[i] == false) {
        R = math.Random().nextInt(129) + 128;
        G = math.Random().nextInt(129) + 128;
        B = math.Random().nextInt(129) + 128;

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L[i] = intColor;
      }

      setState(() {
        listColor = L;
      });
      if(SelectList[i])selectedColor=listColor[i];
    }
  }

  void generateMonochromeColors(int n) {
    Color rcolor = Color(math.Random().nextInt(0xFFFFFF));
    List Ls = RandomListShades(n);
    List L = listColor.toList();
    int R = math.Random().nextInt(256);
    int G = math.Random().nextInt(256);
    int B = math.Random().nextInt(256);
    MaterialColor matColor = getMaterialColor(rcolor, size);

    for (int i = 0; i < size; i++) {
      int S = Ls[i];
      R = matColor[S].red;
      G = matColor[S].green;
      B = matColor[S].blue;
      String color;
      int intColor;
      if (lockList[i] == false) {
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L[i] = intColor;
      }
    }
    setState(() {
      listColor = L;
    });
    int j=SelectList.indexWhere((element) => element==true);
    selectedColor=listColor[j];
  }

  T getRandomElement<T>(List<T> list) {
    final random = new math.Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  static const List shades = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  List RandomListShades(int sizePalette) {
    List L = [];
    int j = math.Random().nextInt(10);
    for (int i = 0; i < size; i++) {
      while (L.contains(shades[j])) {
        j = math.Random().nextInt(10);
      }
      L.add(shades[j]);
    }
    return L;
  }

  MaterialColor getMaterialColor(Color color, int sizePalette) {
    List strengths = <double>[0.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;
    for (int i = 1; i <= 9; i++) {
      strengths.add(0.1 * i);
    }

    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
          r + ((ds < 0 ? r : (255 - r)) * ds).round(),
          g + ((ds < 0 ? g : (255 - g)) * ds).round(),
          b + ((ds < 0 ? b : (255 - b)) * ds).round(),
          1);
    });

    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: lightpurple,
      body: Stack(
        children:[
          Container(
            alignment: AlignmentDirectional.topEnd,
            child: Container(
                width: w*0.8,
                height: h*0.17,
                child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",fit:BoxFit.fill),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(w*0.01,h*0.045, 0,0),
            child: IconButton(icon: Icon(CustomIcons.back,size: h*0.026,), onPressed: (){
              Navigator.of(context).pop();
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height:h*0.04,
                width: w*0.27,
                margin: EdgeInsets.only(top:h*0.06),
                child: SvgPicture.asset("assets/SVG/myPalette.svg",fit:BoxFit.fill,),

              ),
            ],
          ),
          Container(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
                width: w*0.88,
                height: h*0.41,
                child: SvgPicture.asset("assets/SVG/rectangleBas.svg",fit:BoxFit.fill)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin:EdgeInsets.only(top:h*0.23),
                child: Text(
                  "$type",
                  style: TextStyle(
                      fontFamily: ftype2,
                      fontSize: h*0.037,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ],
          ),
          Container(
                height: h*0.35,
                width: w*0.83,
                margin: EdgeInsets.fromLTRB(w*0.08,h*0.32, 0,0),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(h*0.0369)),
                  boxShadow: [
                    BoxShadow(
                      color: shadowcolor,
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
               child: Column(
                  children: [
                    Container(
                      margin:EdgeInsets.symmetric(horizontal: w*0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(isLocked ? CustomIcons.locked : CustomIcons.unlocked,size: h*0.025,),
                            constraints: BoxConstraints(maxHeight: h*0.035),
                            onPressed: () {
                              setState(() {
                                isLocked = !isLocked;
                                for (int i = 0; i < size; i++) {
                                  if (SelectList[i] == true) {
                                    if (lockList[i] == true) {
                                      lockList[i] = false;
                                    } else {
                                      lockList[i] = true;
                                    }
                                  }
                                }
                              });
                            },
                          ),
                          IconButton(icon: isfavorite ? Icon(Icons.favorite,color: favorite_onC,size: h*0.035,)
                              :Icon(CustomIcons.favorite_off,color: favorite_offC,size:h*0.035),
                              constraints: BoxConstraints(maxHeight: h*0.035),
                              onPressed: () {
                                if(isfavorite){
                                  setState(() {
                                    isfavorite=false;
                                  });

                                  Provider.of<Palettes>(context, listen: false)
                                      .delete(Provider.of<Palettes>(context, listen: false).listPalettes.last.id);

                                }
                                else{
                                  setState(() {
                                    isfavorite=true;
                                  });
                                  Provider.of<Palettes>(context, listen: false)
                                      .add(listColors: listColor);
                                }
                                }
                          ),
                        ],
                      ),
                    ),
                    Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: h*0.35*0.057),
                              decoration: BoxDecoration(
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ...listColor.map((val) {
                                    return GestureDetector(
                                      child: Container(
                                        height: h*0.23,
                                        width: w*0.11,
                                        decoration: BoxDecoration(
                                          color: Color(val).withOpacity(1.0),
                                          borderRadius:
                                              BorderRadius.only(
                                                  topLeft: Radius.circular(h*0.015),
                                                  topRight: Radius.circular(h*0.015),
                                              ),
                                          boxShadow: [

                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.15),
                                            spreadRadius: 3,
                                            blurRadius: 5,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                          ],
                                        ),
                                        child: Neumorphic(
                                          style: NeumorphicStyle(
                                            boxShape:NeumorphicBoxShape.roundRect(BorderRadius.only(
                                                topLeft: Radius.circular(h*0.015),
                                                topRight: Radius.circular(h*0.015)
                                            ),
                                            ),
                                            depth: -5,
                                            shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                                            shadowLightColorEmboss: Color(val).withOpacity(1.0),
                                            color: Color(val).withOpacity(1.0),

                                          ),
                                          child: Column(
                                              children: [
                                                Container(
                                                  margin:EdgeInsets.only(top:h*0.017),
                                                  height: h*0.025,
                                                  width: w*0.042,
                                                  child: lockList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? Icon(CustomIcons.locked,size: h*0.025,)
                                                      : Text(' '),
                                                ),
                                                Container(
                                                  height: h*0.014,
                                                  width: h*0.014,
                                                  margin:EdgeInsets.only(top:h*0.16),
                                                  child: (SelectList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? CircleAvatar(radius: 6,backgroundColor: white,)
                                                      : Text(' ')),
                                                )
                                              ],
                                            ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          var j = listColor
                                              .indexWhere((element) => element == val);
                                          getindex(val);
                                          isLocked=lockList[j];
                                          SelectList[j] = true;
                                          for (int i = 0; i < size; i++) {
                                            if (i != j) SelectList[i] = false;
                                          }
                                          selectedColor = listColor[j];
                                        });
                                      },
                                    );
                                  }).toList(),
                                ],
                              ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:h*0.019),
                            height: h*0.025,
                            child: FlatButton(
                              child: Text(
                                "#${selectedColor.toRadixString(16)}",
                                style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                    fontFamily: ftype1,
                                    fontSize: h*0.024,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onPressed: () {
                                Toast.show(
                                  "${selectedColor.toRadixString(16)} copied to Clipboard",
                                  context,
                                  duration: 2,
                                  gravity: Toast.TOP,
                                  backgroundRadius: 30,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
          Container(
            margin: EdgeInsets.only(top: h*0.84),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      barrierColor: barriercolor,
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        var j = listColor.indexWhere((element) =>
                        element == selectedColor);
                        Color c=Color(listColor[j]).withOpacity(1);
                        return RgbPicker(
                          r: c.red*1.0,
                          g: c.green*1.0,
                          b: c.blue*1.0,
                          a:1.0,
                        );
                      },
                    ).then((val) {
                      if (val != null) {
                        var j = listColor.indexWhere((element) =>
                        element == selectedColor);
                        print("j=$j");
                        int R = val.red;
                        int G = val.green;
                        int B = val.blue;
                        String color;
                        int intColor;
                        color = componentToHex(R) +
                            componentToHex(G) +
                            componentToHex(B);
                        intColor = int.parse(color, radix: 16);
                        setState(() {
                          listColor[j] = intColor;
                          selectedColor = intColor;
                        });
                        setState(() {

                        });
                      }
                    });
                  },
                  icon: Icon(GoogleIcons.sliders_h,size: w*0.08),
                ),
                Container(
                  width: w*0.256,
                  height: h*0.0467,

                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h*0.018),
                    ),
                    color: white,
                    child: Text(generate,style: TextStyle(
                        fontFamily: ftype1,
                        fontStyle: FontStyle.normal,
                        fontSize: h*0.02,
                        fontWeight: FontWeight.w500),),
                    onPressed: () {
                      var j = listColor.indexWhere((element) =>
                      element == selectedColor);
                      setState(() {
                        selectedColor = listColor[j];
                        if(isfavorite){isfavorite=false;}
                      });

                      if (type == wtones)
                        generateWarmColors(size);
                      else if (type == ctones)
                        generateCoolColors(size);
                      else if (type == btones)
                        generateBrightColors(size);
                      else if (type == dtones)
                        generateDarkColors(size);
                      else if (type == mtones)

                        generateMonochromeColors(size);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(CustomIcons.favorite,size: w*0.08,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return FavoritePaletteScreen();
                    }));
                  },
                ),

              ],
            ),
          ),
        ]
      ),
    );
  }
}
