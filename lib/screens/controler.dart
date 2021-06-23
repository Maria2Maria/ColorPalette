import 'dart:convert';
import 'package:color_palette0/screens/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Couleur{
  String hexcolor;
  String rgbcolor;
  String category_id;
  String palette_id;
  int status;
  Couleur({this.hexcolor,this.rgbcolor,this.category_id,this.palette_id,this.status});
}
class Test_API extends StatefulWidget {
  @override
  _Test_APIState createState() => _Test_APIState();
}

class _Test_APIState extends State<Test_API> {
  @override
  Widget build(BuildContext context) {
    List L= [Color.fromRGBO(0, 0, 0, 0.5),Color.fromRGBO(0, 0, 0, 0.5),Color.fromRGBO(0, 0, 0, 0.5)];

    return Scaffold(
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('add'),
          onPressed: () async {

            addNewPalette(listColors:L,size:"3",category_id:"2");
           // var m= await getAllPalettes();

            //print("${m[0].colors}");
            //deletePalette(m[0]);
            //getAllColors();

           // deletePalette(15);
            //deleteColor(1);
          },
        ),
      ),
    );
  }
}

Future<void> addNewPalette({List listColors,String size, String category_id, My_Palette addedpalette} ) async {

  final String url_palettes = "https://sheltered-meadow-96479.herokuapp.com/api/palettes";
  final String url_colors = "https://sheltered-meadow-96479.herokuapp.com/api/colors";
  //create the palette and take its id
  http.Response res = await http.post(Uri.parse(url_palettes), body:{
    "size":size,
    "category_id": category_id,
    "favourite": "1",
  });
List L=[];
  //add the colors to the palette with palette_d
  for(int i=0; i<int.parse(size); i++){
    //String s=json.decode(res.body)["data"];
    //print("id_palette=${json.decode(res.body)["id"].runtimeType}");
    int R=listColors[i].red;
    int G=listColors[i].green;
    int B=listColors[i].blue;
    double alpha=listColors[i].opacity;
    http.Response res2 = await http.post(Uri.parse(url_colors), body: {
      "hexcolor": "0xFF00FF",//"0x${fromRGBtoHex(listColors[i]).toRadixString(16)}",
      "rgbcolor": "$R,$G,$B,$alpha",
      "category_id": "$category_id",
      "palette_id": json.decode(res.body)["id"].toString(),
      "status":"1",
    });
    //print("${json.decode(res2.body)["id"].runtimeType}");
    //L.add(My_Color(json.decode(res2.body)["id"],Color.fromRGBO(R, G, B, alpha)));
  }

  //addedpalette=My_Palette(L, int.parse(size), json.decode(res.body)["id"].toString());
}

Future<List> getAllPalettes() async{
  List<My_Palette> palettes_colors=[];
  List palettes=[];
  List colors=[];
  final String url_palettes = "https://sheltered-meadow-96479.herokuapp.com/api/palettes";
  final String url_colors = "https://sheltered-meadow-96479.herokuapp.com/api/colors";
  http.Response res_palettes = await http.get(Uri.parse(url_palettes));
  http.Response res_colors = await http.get(Uri.parse(url_colors));
  palettes =json.decode(res_palettes.body)["data"];
  colors=json.decode(res_colors.body)["data"];
  var s=colors[0]["attributes"]["rgbcolor"];
  print("rgb=${s.split(",")}");
  String palette_id;
  for(int i=0; i<palettes.length;i++){
    palette_id=palettes[i]["id"];
    int size=int.parse(palettes[i]["attributes"]["size"]);
    List L=[];
    for(int j=0;j<size;j++){
      var s=(colors[j]["attributes"]["rgbcolor"]).split(",");
      print("s2=${s[2]}");
      String color_id=colors[j]["id"];
      //L.add(Color.fromRGBO(int.parse(s[0]), int.parse(s[1]),int.parse(s[2]),1.0));
      L.add(My_Color(color_id, Color.fromRGBO(int.parse(s[0]), int.parse(s[1]),int.parse(s[2]),double.parse(s[3]))));
    }
    palettes_colors.add(My_Palette(L, size, palette_id));
  }
  return palettes_colors;
}

Future<void> deletePalette(My_Palette p) async{
  final String url_palettes = "https://sheltered-meadow-96479.herokuapp.com/api/palettes/${p.id}";
  http.Response res = await http.delete(Uri.parse(url_palettes));
  String url_colors;
  for(int i=0; i<p.size;i++){
    url_colors = "https://sheltered-meadow-96479.herokuapp.com/api/colors/${p.colors[i].id}";
    http.Response res = await http.delete(Uri.parse(url_colors));
  }
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