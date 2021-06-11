import 'dart:core';

import 'package:color_palette0/custom_icons_icons.dart';
import 'package:color_palette0/google_icons_icons.dart';
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
    if (types == "Warm tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Cold tones") {
      for (int i = 0; i < n; i++) {
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Dark tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(128);
        G = math.Random().nextInt(128);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Bright tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(129) + 128;
        G = math.Random().nextInt(129) + 128;
        B = math.Random().nextInt(129) + 128;
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Monochrome") {
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
        //your methode to calculate the colors is not ok, it never gives you some colors like yellow and green in cool tones
        R = math.Random().nextInt(256 - 128) + 128;//sure
        G = math.Random().nextInt(256);//in the app
        //G=0;
        //B = math.Random().nextInt(R + 1);
        B = math.Random().nextInt(128);
        //B=math.Random().nextInt(256 - 128) + 128;

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
        //B = math.Random().nextInt(256 - 128) + 128;
        //G = (math.Random().nextInt(256));
        //R = math.Random().nextInt(B + 1);

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

  Color currentColor = Colors.indigo;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    List<Palette> listP =
        Provider.of<Palettes>(context, listen: false).listPalettes;
    return Scaffold(
      backgroundColor:Color(0xECEDF3).withOpacity(1),
      body: SafeArea(
        child: Stack(
          children:[
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  width: w*0.8,
                  height: h*0.17,
                  child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",fit:BoxFit.fill)),
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
                        fontFamily: 'Cairo',
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
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(h*0.0369)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
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
                            //SizedBox(width: w*0.045,),
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
                            IconButton(icon: isfavorite ? Icon(Icons.favorite,color: Colors.red,size: h*0.035,)
                                :Icon(CustomIcons.favorite_off,color: Color(0x979797).withOpacity(1),size:h*0.035),
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
                            //SizedBox(width: w*0.045,),
                          ],
                        ),
                      ),
                      Column(
                          children: [
                            Container(
                                //width: double.infinity,
                              margin: EdgeInsets.only(top: h*0.35*0.057),
                              //margin: EdgeInsets.only(top: h*0.057),
                                decoration: BoxDecoration(
                                  //color: Colors.red,
                                  /*borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),*/
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ...listColor.map((val) {
                                      return GestureDetector(
                                        child: Container(
                                          height: h*0.23,
                                          width: w*0.11,
                                          //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                           // margin: EdgeInsets.only(top: h*0.06*0.16),
                                            //margin: EdgeInsets.only(top: h*0.22*0.05),
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
                                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Container(
                                                    margin:EdgeInsets.only(top:h*0.017),
                                                    height: h*0.025,
                                                    width: w*0.042,
                                                    //color: Colors.black,
                                                    child: lockList[listColor.indexWhere(
                                                            (element) => element == val)]
                                                        ? Icon(CustomIcons.locked,size: h*0.025,)
                                                        : Text(' '),
                                                  ),
                                                  Container(
                                                    //margin:EdgeInsets.only(top:h*0.22*0.2),
                                                    height: h*0.014,
                                                    width: h*0.014,
                                                    margin:EdgeInsets.only(top:h*0.16),
                                                    child: (SelectList[listColor.indexWhere(
                                                            (element) => element == val)]
                                                        ? CircleAvatar(radius: 6,backgroundColor: Colors.white,)
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
                                            print("${SelectList[j]}");
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
                             // color: Colors.yellow,
                              child: FlatButton(
                                child: Text(
                                  "#${selectedColor.toRadixString(16)}",
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                      fontFamily: 'Roboto',
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
                        barrierColor: Color.fromRGBO(16, 16, 16,0.2),
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
                      color: Colors.white,
                      child: Text("Generate",style: TextStyle(
                          fontFamily: 'Roboto',
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

                        if (type == "Warm tones")
                          generateWarmColors(size);
                        else if (type == "Cold tones")
                          generateCoolColors(size);
                        else if (type == "Bright tones")
                          generateBrightColors(size);
                        else if (type == "Dark tones")
                          generateDarkColors(size);
                        else if (type == "Monochrome")
                          generateMonochromeColors(size);
                        //generate(size);
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
      ),
    );
  }
}
//lastest version
/*
import 'dart:core';

import 'package:color_palette0/custom_icons_icons.dart';
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
    if (types == "Warm tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Cold tones") {
      for (int i = 0; i < n; i++) {
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Dark tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(128);
        G = math.Random().nextInt(128);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Bright tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(129) + 128;
        G = math.Random().nextInt(129) + 128;
        B = math.Random().nextInt(129) + 128;
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Monochronome") {
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
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

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
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);
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

  Color currentColor = Colors.indigo;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    List<Palette> listP =
        Provider.of<Palettes>(context, listen: false).listPalettes;
    return Scaffold(
      backgroundColor:Color(0xECEDF3).withOpacity(1),
      body: SafeArea(
        child: Stack(
          children:[
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset("assets/SVG/rectangleHaut.svg"),
            ),
            IconButton(icon: Icon(CustomIcons.back), onPressed: (){
              Navigator.of(context).pop();
            }),
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
              child: SvgPicture.asset("assets/SVG/rectangleBas.svg"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin:EdgeInsets.only(top:h*0.23),
                  child: Text(
                    "$type",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
                  height: h*0.35,
                  width: w*0.83,
                  margin: EdgeInsets.fromLTRB(w*0.08,h*0.32, 0,0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        //spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                 child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(isLocked ? CustomIcons.locked : CustomIcons.unlocked),
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
                          IconButton(icon: isfavorite ? Icon(CustomIcons.favorite_on,color: Colors.red,)
                              :Icon(CustomIcons.favorite_off),
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
                      Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ...listColor.map((val) {
                                      return GestureDetector(
                                        child: Container(
                                          height: h*0.22,
                                          width: w*0.11,
                                          //margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                            margin: EdgeInsets.only(top: h*0.06*0.16),
                                          decoration: BoxDecoration(
                                            color: Color(val).withOpacity(1.0),
                                            borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10)
                                                ),
                                            boxShadow: [

                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                            ],
                                          ),
                                          child: Neumorphic(
                                            style: NeumorphicStyle(
                                              depth: -5,
                                              shadowDarkColorEmboss: Colors.black,
                                              shadowLightColorEmboss: Color(val).withOpacity(1.0),
                                              color: Color(val).withOpacity(1.0),

                                            ),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  lockList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? Icon(CustomIcons.locked)
                                                      : Text(' '),
                                                  (SelectList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? CircleAvatar(radius: 5,backgroundColor: Colors.white,)
                                                      : Text(' ')),
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
                                            print("${SelectList[j]}");
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
                            FlatButton(
                              child: Text(
                                "#${selectedColor.toRadixString(16)}",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
                          ],
                        ),

                    ],
                  ),
                ),
            Container(
              margin: EdgeInsets.only(top: h*0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        barrierColor: Color.fromRGBO(16, 16, 16,0.2),
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return RgbPicker(
                            r: 0.0,
                            g: 0.0,
                            b: 0.0,
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
                    icon: Icon(Icons.list),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      //side: BorderSide(color: Colors.red)
                    ),
                    color: Colors.white,
                    child: Text("Generate",style: TextStyle(fontWeight: FontWeight.bold),),
                    onPressed: () {
                      var j = listColor.indexWhere((element) =>
                      element == selectedColor);
                      setState(() {
                        selectedColor = listColor[j];
                        if(isfavorite){isfavorite=false;}
                      });

                      if (type == "Warm tones")
                        generateWarmColors(size);
                      else if (type == "Cold tones")
                        generateCoolColors(size);
                      else if (type == "Bright tones")
                        generateBrightColors(size);
                      else if (type == "Dark tones")
                        generateDarkColors(size);
                      else if (type == "Monochronome")
                        generateMonochromeColors(size);
                      //generate(size);
                    },
                  ),
                  IconButton(
                    icon: Icon(CustomIcons.favorite),
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
      ),
    );
  }
}

 */
//last version
/*
import 'dart:core';

import 'package:color_palette0/custom_icons_icons.dart';
import 'package:color_palette0/screens/favorite_palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../palette.dart';
import 'dart:math' as math;
import 'package:toast/toast.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    if (types == "Warm tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Cold tones") {
      for (int i = 0; i < n; i++) {
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Dark tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(128);
        G = math.Random().nextInt(128);
        B = math.Random().nextInt(128);

        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Bright tones") {
      for (int i = 0; i < n; i++) {
        R = math.Random().nextInt(129) + 128;
        G = math.Random().nextInt(129) + 128;
        B = math.Random().nextInt(129) + 128;
        color = componentToHex(R) + componentToHex(G) + componentToHex(B);
        intColor = int.parse(color, radix: 16);
        L.add(intColor);
      }
    } else if (types == "Monochronome") {
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
        R = math.Random().nextInt(256 - 128) + 128;
        G = math.Random().nextInt(129);
        B = math.Random().nextInt(R + 1);

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
        B = math.Random().nextInt(256 - 128) + 128;
        G = (math.Random().nextInt(256));
        R = math.Random().nextInt(B + 1);
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

  Color currentColor = Colors.indigo;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    List<Palette> listP =
        Provider.of<Palettes>(context, listen: false).listPalettes;
    return Scaffold(
      backgroundColor:Color(0xECEDF3).withOpacity(1),
      body: SafeArea(
        child: Stack(
          children:[
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset("assets/SVG/rectangleHaut.svg"),
            ),
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
              Navigator.of(context).pop();
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top:50),
                  child: SvgPicture.asset("assets/SVG/myPalette.svg"),

                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: SvgPicture.asset("assets/SVG/rectangleBas.svg"),
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.only( top: 100),
                    child: Text(
                      "$type",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(height: 10,),
                Container(
                  //margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 310,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        //spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      //don't forget it
                      //
                      //there is a probleme with lock and favorite
                      //when i click on favorite it will be red, but when i click on generate it still red
                      //when i clich on lock it will be closed but when i move to another color the outside lock
                      //still locked, it should be unlocked when i move to another
                      //
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(isLocked ? Icons.lock : Icons.lock_open),
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
                          IconButton(icon: isfavorite? Icon(Icons.favorite,color: Colors.red,)
                              :Icon(Icons.favorite_border),
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
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ...listColor.map((val) {
                                      return GestureDetector(
                                        child: Container(
                                          height: 180,
                                          width: 40,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Color(val).withOpacity(1.0),
                                            borderRadius:
                                                BorderRadius.only(topLeft: Radius.circular(10),
                                                    topRight: Radius.circular(10)
                                                ),
                                            boxShadow: [

                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(0, 3), // changes position of shadow
                                            ),
                                            ],
                                          ),
                                          child: Neumorphic(
                                            style: NeumorphicStyle(
                                              depth: -5,
                                              shadowDarkColorEmboss: Colors.black,
                                              shadowLightColorEmboss: Color(val).withOpacity(1.0),
                                              color: Color(val).withOpacity(1.0),

                                            ),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceAround,
                                                children: [
                                                  lockList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? Icon(Icons.lock)
                                                      : Text(' '),
                                                  (SelectList[listColor.indexWhere(
                                                          (element) => element == val)]
                                                      ? CircleAvatar(radius: 5,backgroundColor: Colors.white,)
                                                      : Text(' ')),
                                                ],
                                              ),
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            var j = listColor
                                                .indexWhere((element) => element == val);
                                            getindex(val);
                                            SelectList[j] = true;
                                            print("${SelectList[j]}");
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
                            FlatButton(
                              child: Text(
                                "#${selectedColor.toRadixString(16)}",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),

                Container(
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                       // elevation: 3.0,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                titlePadding: const EdgeInsets.all(0.0),
                                contentPadding: const EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SlidePicker(
                                        pickerColor: currentColor,
                                        onColorChanged: changeColor,
                                        paletteType: PaletteType.rgb,
                                        enableAlpha: false,
                                        displayThumbColor: true,
                                        showLabel: false,
                                        showIndicator: true,
                                        indicatorBorderRadius:
                                            const BorderRadius.vertical(
                                          top: const Radius.circular(25.0),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: SvgPicture.asset(
                                              "assets/SVG/close.svg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          RaisedButton(
                                            onPressed: () {
                                              var j = listColor.indexWhere((element) =>
                                                  element == selectedColor);
                                              print("j=$j");
                                              int R = currentColor.red;
                                              int G = currentColor.green;
                                              int B = currentColor.blue;
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
                                              Navigator.of(context).pop();
                                            },
                                            child: SvgPicture.asset(
                                              "assets/SVG/validate.svg",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        //i need to convert it to an icon, you have seen that before
                       /* child: SvgPicture.asset(
                          "assets/SVG/rgb.svg",
                          fit: BoxFit.cover,
                        ),*/
                        //color: currentColor,
                        /*textColor: useWhiteForeground(currentColor)
                            ? const Color(0xffffffff)
                            : const Color(0xff000000),*/
                        icon: Icon(Icons.list),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            //side: BorderSide(color: Colors.red)
                        ),
                        color: Colors.white,
                        child: Text("Generate",style: TextStyle(fontWeight: FontWeight.bold),),
                        onPressed: () {
                          var j = listColor.indexWhere((element) =>
                          element == selectedColor);
                          setState(() {
                            selectedColor = listColor[j];
                          });

                          if (type == "Warm tones")
                            generateWarmColors(size);
                          else if (type == "Cold tones")
                            generateCoolColors(size);
                          else if (type == "Bright tones")
                            generateBrightColors(size);
                          else if (type == "Dark tones")
                            generateDarkColors(size);
                          else if (type == "Monochronome")
                            generateMonochromeColors(size);
                          //generate(size);
                        },
                      ),
                      IconButton(
                        icon: Icon(CustomIcons.back),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                            return FavoritePaletteScreen();
                          }));
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}


 */