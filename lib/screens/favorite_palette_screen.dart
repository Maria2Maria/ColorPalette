import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    final key = new GlobalKey<ScaffoldState>();
    List<Palette> tmp = Provider.of<Palettes>(context).listPalettes;
    List<Palette> listP = tmp.reversed.toList();
    return Scaffold(
      backgroundColor:Color(0xFFFFFF).withOpacity(1),
      key: key,
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
                  padding: EdgeInsets.only(top:h*0.07),
                  child: Text("Favorite", style: TextStyle(
                      color: Color(0xFF4E59D3),
                  fontSize: 30),),

                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: SvgPicture.asset("assets/SVG/rectangleBas.svg"),
            ),
            Container(
              margin: EdgeInsets.only(top:h*0.14),
              child: ListView.builder(
                    itemCount: listP.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        //actionExtentRatio: 0.25,
                        actionExtentRatio: 0.15,
                        secondaryActions: <Widget>[
                          IconSlideAction(
                              //caption: 'Delete',
                              color: Colors.red,
                              icon: Icons.delete,
                              foregroundColor: Colors.white,
                              onTap: () {
                                Provider.of<Palettes>(context, listen: false).delete(
                                    listP[index]
                                        .id); //removeFromFavoritePalette(index);
                              }),
                        ],
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: h*0.02),
                              height: h*0.15,
                              width: w*0.87,
                              decoration: BoxDecoration(
                                color: Color(0xFFEFEFEF),
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ...(listP[index]).listColors.map((val) {
                                    return Column(
                                      children: [
                                        Container(
                                              //height: 100,
                                              //width: 40,
                                              height: h*0.09,
                                              width: w*0.08,
                                              margin: EdgeInsets.only(
                                                  top: h*0.02, ),
                                              decoration: BoxDecoration(
                                                color: Color(val).withOpacity(1.0),
                                                borderRadius:
                                                    BorderRadius.all(Radius.circular(30)),
                                              ),
                                            ),
                                        Text("#${val.toRadixString(16)}",style: TextStyle(fontSize: 10),)
                                      ],
                                    );
                                  }).toList(),
                                   IconButton(
                                      icon: Icon(CustomIcons.copy),
                                      onPressed: () {
                                        String s = "";
                                        for (int i = 0;
                                            i < listP[index].listColors.length;
                                            i++) {
                                          s += (listP[index].listColors[i])
                                                  .toRadixString(16) +
                                              " ";
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
            ),]
        ),
      ),
    );
  }
}
