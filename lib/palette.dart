import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Palette{
  final int size;
  final String id;
  List listColors=[];
  Palette({this.id,this.size,this.listColors});
}

class Palettes with ChangeNotifier{
  List<Palette> listPalettes=[];

  Future<void> add({List listColors, String id }) async{
  try {

    final String url = "https://color-palette-b5f31-default-rtdb.firebaseio.com/palette.json";
    http.Response res = await http.post(Uri.parse(url), body: json.encode({
      "id": id,
      "listColors": listColors,
    }));

    listPalettes.add(Palette(
      id: json.decode(res.body)['name'],
      listColors: listColors,
    ));
    notifyListeners();
  }catch(e){
    throw e;
  }
  }
  Future<void> fetchData() async{

    final String url="https://color-palette-b5f31-default-rtdb.firebaseio.com/palette.json";
    try{
      final http.Response res=await http.get(Uri.parse(url));
      final extractedData=json.decode(res.body) as Map<String, dynamic>;
      extractedData.forEach((listId,listData) {
        var isExist=listPalettes.firstWhere((element) => element.id==listId, orElse: ()=>null);
        if(isExist==null){
          listPalettes.add(Palette(
              id: listId,
              listColors: listData["listColors"],)
          );
        }
      });
      notifyListeners();
    }catch(error){
      throw error;
    }
  }

  Future<void> delete(String id)async{
    final String url="https://color-palette-b5f31-default-rtdb.firebaseio.com/palette/$id.json";
    final index=listPalettes.indexWhere((element) => element.id==id);
    var Item=listPalettes[index];
     listPalettes.removeAt(index);
    notifyListeners();
    var res=await http.delete(Uri.parse(url));
    if(res.statusCode>=400){
      listPalettes.insert(index,Item);
      notifyListeners();
      print("could not delete item");
    }else{
      Item=null;
      print("item deleted");
    }
    }
}

