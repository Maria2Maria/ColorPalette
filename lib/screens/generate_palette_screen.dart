import 'dart:core';

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
                        icon: Icon(Icons.favorite_border_sharp),
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

