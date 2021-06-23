/*import 'package:color_palette0/resources/col_font_stg.dart';
import 'package:color_palette0/screens/controler.dart';
import 'package:color_palette0/screens/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../custom_icons_icons.dart';
import '../palette.dart';
import 'package:toast/toast.dart';

class FavoritePaletteScreen extends StatefulWidget {
  @override
  _FavoritePaletteScreenState createState() => _FavoritePaletteScreenState();
}

class _FavoritePaletteScreenState extends State<FavoritePaletteScreen> {
  @override
  void initState() {
    //Provider.of<Palettes>(context, listen: false).fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final key = new GlobalKey<ScaffoldState>();
    //List<My_Palette> L= await getAllPalettes();
    //List<Palette> tmp = Provider.of<Palettes>(context).listPalettes;
    //List<Palette> listP = tmp.reversed.toList();
    return Scaffold(
      backgroundColor: white,
      key: key,
      body: FutureBuilder<List>(
    future: getAllPalettes(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (!snapshot.hasData) {
          // while data is loading:
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // data loaded:
          List L=snapshot.data;
           List favorites = L.reversed.toList();
          return Stack(children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: w * 0.8,
                height: h * 0.14,
                child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(w * 0.01, h * 0.045, 0, 0),
              child: IconButton(
                  icon: Icon(
                    CustomIcons.back,
                    size: h * 0.026,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.only(top: h * 0.07),
                  child: Text(
                    favorite,
                    style: TextStyle(
                        color: purple,
                        fontFamily: ftype1,
                        fontStyle: FontStyle.normal,
                        fontSize: h * 0.03),
                  ),
                ),
              ],
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
            Container(
              margin: EdgeInsets.only(top: h * 0.16),
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 0),
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.15,
                      secondaryActions: <Widget>[
                        IconSlideAction(
                            color: Colors.red,
                            icon: Icons.delete,
                            foregroundColor: Colors.white,
                            onTap: () {
                              //print("id=${p.id}");
                              deletePalette(favorites[index]);
                              setState(() {
                                favorites.removeAt(index);
                              });
                              //Provider.of<Palettes>(context, listen: false).delete(p.id);
                            }),
                      ],
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: h * 0.02),
                            height: h * 0.15,
                            width: w * 0.87,
                            decoration: BoxDecoration(
                              color: lightgrey,
                              borderRadius: BorderRadius.all(Radius.circular(h * 0.0369)),
                              boxShadow: [
                                BoxShadow(
                                  color: shadowcolor,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Stack(
                                children: [
                                  (favorites[index].colors.length<=4)? Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ...(favorites[index]).colors.map((val) {
                                        print("$val");
                                        return Column(
                                          children: [
                                            Container(
                                              height: h * 0.09,
                                              width: w * 0.088,
                                              margin: EdgeInsets.only(
                                                top: h * 0.02,
                                              ),
                                              decoration: BoxDecoration(
                                                color: val.color,
                                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                              ),
                                              child: Neumorphic(
                                                style: NeumorphicStyle(
                                                  boxShape: NeumorphicBoxShape.roundRect(
                                                    BorderRadius.all(Radius.circular(30)),
                                                  ),
                                                  depth: -5,
                                                  shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                                                  //shadowLightColorEmboss: Color(val).withOpacity(1.0),
                                                  shadowLightColorEmboss: val.color,
                                                  //color: Color(val).withOpacity(1.0),
                                                  color: val.color,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: h*0.0036,),
                                            Text(
                                              "#${fromRGBtoHex(val).toRadixString(16)}",
                                              style: TextStyle(
                                                fontFamily: ftype1,
                                                fontStyle: FontStyle.normal,
                                                fontSize: h * 0.013,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        );
                                      }).toList(),

                                    ],
                                  ) :
                                  Container(
                                    width: w*0.8,
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ...(favorites[index]).colors.map((val) {
                                          return Column(
                                            children: [
                                              Container(
                                                height: h * 0.09,
                                                width: w * 0.088,
                                                margin: EdgeInsets.only(
                                                  top: h * 0.028,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: val.color,
                                                  borderRadius: BorderRadius.all(Radius.circular(30)),
                                                ),
                                                child: Neumorphic(
                                                  style: NeumorphicStyle(
                                                    boxShape: NeumorphicBoxShape.roundRect(
                                                      BorderRadius.all(Radius.circular(30)),
                                                    ),
                                                    depth: -5,
                                                    shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                                                    shadowLightColorEmboss: val.color,
                                                    color: val.color,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: h*0.0036,),
                                              Text(
                                                "#${fromRGBtoHex(val.color).toRadixString(16)}",
                                                style: TextStyle(
                                                  fontFamily: ftype1,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: h * 0.013,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          );
                                        }).toList(),

                                      ],
                                    ),
                                  ),
                                  /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...(p).listColors.map((val) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.09,
                        width: w * 0.088,
                        margin: EdgeInsets.only(
                          top: h * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Color(val).withOpacity(1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Neumorphic(
                            style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(30)),
                          ),
                          depth: -5,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: Color(val).withOpacity(1.0),
                          color: Color(val).withOpacity(1.0),
                        ),
                        ),
                      ),
                      Text(
                        "#${val.toRadixString(16)}",
                        style: TextStyle(
                          fontFamily: ftype1,
                          fontStyle: FontStyle.normal,
                          fontSize: h * 0.013,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  );
                }).toList(),

              ],
            ),*/
                                  Container(
                                    //color: red,
                                    margin: EdgeInsets.fromLTRB(w*0.77,h*0.04,0,0),
                                    child: IconButton(
                                      icon: Icon(
                                        CustomIcons.copy,
                                        size: h * 0.03,
                                      ),
                                      onPressed: () {
                                        String s = "";
                                        for (int i = 0; i < favorites[index].colors.length; i++) {
                                          s += (fromRGBtoHex(favorites[index].colors[i])).toRadixString(16) + " ";
                                        }
                                        Clipboard.setData(new ClipboardData(text: "$s"));
                                        Toast.show(
                                          "$s copied to Clipboard",
                                          context,
                                          duration: 2,
                                          gravity: Toast.TOP,
                                          backgroundRadius: 30,
                                        );
                                      },
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ]);
        }
      },
    ),


    );
  }
}

/*Widget FavPalette(My_Palette p, BuildContext context, var h, var w) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.15,
    secondaryActions: <Widget>[
      IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          foregroundColor: Colors.white,
          onTap: () {
            //print("id=${p.id}");
            deletePalette(p);

            //Provider.of<Palettes>(context, listen: false).delete(p.id);
          }),
    ],
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: h * 0.02),
          height: h * 0.15,
          width: w * 0.87,
          decoration: BoxDecoration(
            color: lightgrey,
            borderRadius: BorderRadius.all(Radius.circular(h * 0.0369)),
            boxShadow: [
              BoxShadow(
                color: shadowcolor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              (p.listColors.length<=4)? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...(p).listColors.map((val) {
                print("$val");
                return Column(
                  children: [
                    Container(
                      height: h * 0.09,
                      width: w * 0.088,
                      margin: EdgeInsets.only(
                        top: h * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: val,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          depth: -5,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          //shadowLightColorEmboss: Color(val).withOpacity(1.0),
                          shadowLightColorEmboss: val,
                          //color: Color(val).withOpacity(1.0),
                          color: val,
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.0036,),
                    Text(
                      "#${fromRGBtoHex(val).toRadixString(16)}",
                      style: TextStyle(
                        fontFamily: ftype1,
                        fontStyle: FontStyle.normal,
                        fontSize: h * 0.013,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                );
              }).toList(),

            ],
          ) :
              Container(
                width: w*0.8,
                child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ...(p).listColors.map((val) {
          return Column(
            children: [
              Container(
                height: h * 0.09,
                width: w * 0.088,
                margin: EdgeInsets.only(
                  top: h * 0.028,
                ),
                decoration: BoxDecoration(
                  color: val,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(30)),
                    ),
                    depth: -5,
                    shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                    shadowLightColorEmboss: val,
                    color: val,
                  ),
                ),
              ),
              SizedBox(height: h*0.0036,),
              Text(
                "#${fromRGBtoHex(val).toRadixString(16)}",
                style: TextStyle(
                  fontFamily: ftype1,
                  fontStyle: FontStyle.normal,
                  fontSize: h * 0.013,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          );
        }).toList(),

      ],
    ),
              ),
              /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...(p).listColors.map((val) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.09,
                        width: w * 0.088,
                        margin: EdgeInsets.only(
                          top: h * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Color(val).withOpacity(1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Neumorphic(
                            style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(30)),
                          ),
                          depth: -5,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: Color(val).withOpacity(1.0),
                          color: Color(val).withOpacity(1.0),
                        ),
                        ),
                      ),
                      Text(
                        "#${val.toRadixString(16)}",
                        style: TextStyle(
                          fontFamily: ftype1,
                          fontStyle: FontStyle.normal,
                          fontSize: h * 0.013,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  );
                }).toList(),

              ],
            ),*/
              Container(
                //color: red,
                margin: EdgeInsets.fromLTRB(w*0.77,h*0.04,0,0),
                child: IconButton(
                  icon: Icon(
                    CustomIcons.copy,
                    size: h * 0.03,
                  ),
                  onPressed: () {
                    String s = "";
                    for (int i = 0; i < p.listColors.length; i++) {
                      s += (fromRGBtoHex(p.listColors[i])).toRadixString(16) + " ";
                    }
                    Clipboard.setData(new ClipboardData(text: "$s"));
                    Toast.show(
                      "$s copied to Clipboard",
                      context,
                      duration: 2,
                      gravity: Toast.TOP,
                      backgroundRadius: 30,
                    );
                  },
                ),
              ),
            ]
          ),
        ),
      ],
    ),
  );
}*/
String componentToHex(int c) {
  var hex = c.toRadixString(16);
  return hex.length == 1 ? "0" + hex : hex;
}
int fromRGBtoHex(Color rgbcolor){
  String color = componentToHex(rgbcolor.red) + componentToHex(rgbcolor.green) + componentToHex(rgbcolor.blue);
  int intColor = int.parse(color, radix: 16);
  return intColor;
}
*/
import 'package:color_palette0/resources/col_font_stg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../custom_icons_icons.dart';
import '../palette.dart';
import 'package:toast/toast.dart';

class FavoritePaletteScreen extends StatefulWidget {
  @override
  _FavoritePaletteScreenState createState() => _FavoritePaletteScreenState();
}

class _FavoritePaletteScreenState extends State<FavoritePaletteScreen> {
  @override
  void initState() {
    Provider.of<Palettes>(context, listen: false).fetchData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    final key = new GlobalKey<ScaffoldState>();
    List<Palette> tmp = Provider.of<Palettes>(context).listPalettes;
    List<Palette> listP = tmp.reversed.toList();
    return Scaffold(
      backgroundColor: white,
      key: key,
      body: Stack(children: [
        Container(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
              width: w * 0.8,
              height: h * 0.14,
              child: SvgPicture.asset("assets/SVG/rectangleHaut.svg",
                  fit: BoxFit.fill),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(w * 0.01, h * 0.045, 0, 0),
          child: IconButton(
              icon: Icon(
                CustomIcons.back,
                size: h * 0.026,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(top: h * 0.07),
              child: Text(
                favorite,
                style: TextStyle(
                    color: purple,
                    fontFamily: ftype1,
                    fontStyle: FontStyle.normal,
                    fontSize: h * 0.03),
              ),
            ),
          ],
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
        Container(
          margin: EdgeInsets.only(top: h * 0.16),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 0),
              itemCount: listP.length,
              itemBuilder: (BuildContext context, int index) {
                return FavPalette(listP[index], context, h, w);
              }),
        ),
      ]),
    );
  }
}

Widget FavPalette(Palette p, BuildContext context, var h, var w) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.15,
    secondaryActions: <Widget>[
      IconSlideAction(
          color: Colors.red,
          icon: Icons.delete,
          foregroundColor: Colors.white,
          onTap: () {
            Provider.of<Palettes>(context, listen: false).delete(p.id);
          }),
    ],
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: h * 0.02),
          height: h * 0.15,
          width: w * 0.87,
          decoration: BoxDecoration(
            color: lightgrey,
            borderRadius: BorderRadius.all(Radius.circular(h * 0.0369)),
            boxShadow: [
              BoxShadow(
                color: shadowcolor,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              (p.listColors.length<=4)? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...(p).listColors.map((val) {
                return Column(
                  children: [
                    Container(
                      height: h * 0.09,
                      width: w * 0.088,
                      margin: EdgeInsets.only(
                        top: h * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.all(Radius.circular(30)),
                          ),
                          depth: -5,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                          //shadowLightColorEmboss: val,
                          color: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                          //color: val,
                        ),
                      ),
                    ),
                    SizedBox(height: h*0.0036,),
                    Text(
                      "#${val.toRadixString(16)}",
                      style: TextStyle(
                        fontFamily: ftype1,
                        fontStyle: FontStyle.normal,
                        fontSize: h * 0.013,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                );
              }).toList(),

            ],
          ) :
              Container(
                width: w*0.8,
                child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ...(p).listColors.map((val) {
          return Column(
            children: [
              Container(
                height: h * 0.09,
                width: w * 0.088,
                margin: EdgeInsets.only(
                  top: h * 0.028,
                ),
                decoration: BoxDecoration(
                  color: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(30)),
                    ),
                    depth: -5,
                    shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                    shadowLightColorEmboss: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                    color: val.toString().length>9? Color(val): Color(val).withOpacity(1.0),
                  ),
                ),
              ),
              SizedBox(height: h*0.0036,),
              Text(
                "#${val.toRadixString(16)}",
                style: TextStyle(
                  fontFamily: ftype1,
                  fontStyle: FontStyle.normal,
                  fontSize: h * 0.013,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          );
        }).toList(),

      ],
    ),
              ),
              /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...(p).listColors.map((val) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.09,
                        width: w * 0.088,
                        margin: EdgeInsets.only(
                          top: h * 0.02,
                        ),
                        decoration: BoxDecoration(
                          color: Color(val).withOpacity(1.0),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Neumorphic(
                            style: NeumorphicStyle(
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.all(Radius.circular(30)),
                          ),
                          depth: -5,
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.75),
                          shadowLightColorEmboss: Color(val).withOpacity(1.0),
                          color: Color(val).withOpacity(1.0),
                        ),
                        ),
                      ),
                      Text(
                        "#${val.toRadixString(16)}",
                        style: TextStyle(
                          fontFamily: ftype1,
                          fontStyle: FontStyle.normal,
                          fontSize: h * 0.013,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  );
                }).toList(),

              ],
            ),*/
              Container(
                //color: red,
                margin: EdgeInsets.fromLTRB(w*0.77,h*0.04,0,0),
                child: IconButton(
                  icon: Icon(
                    CustomIcons.copy,
                    size: h * 0.03,
                  ),
                  onPressed: () {
                    print("");
                    String s = "";
                    for (int i = 0; i < p.listColors.length; i++) {
                      s += ((p.listColors[i]).toRadixString(16) + " ");
                    }
                    Clipboard.setData(new ClipboardData(text: "$s"));
                    Toast.show(
                      "$s copied to Clipboard",
                      context,
                      duration: 2,
                      gravity: Toast.TOP,
                      backgroundRadius: 30,
                    );
                  },
                ),
              ),
            ]
          ),
        ),
      ],
    ),
  );
}
String componentToHex(int c) {
  var hex = c.toRadixString(16);
  return hex.length == 1 ? "0" + hex : hex;
}
int fromRGBtoHex(Color rgbcolor){
  String color = componentToHex(rgbcolor.red) + componentToHex(rgbcolor.green) + componentToHex(rgbcolor.blue);
  int intColor = int.parse(color, radix: 16);
  return intColor;
}


