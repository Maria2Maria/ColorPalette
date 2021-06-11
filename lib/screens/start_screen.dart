import 'package:color_palette0/screens/theme_palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StartScreen extends StatelessWidget {
  //The home screen
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      /*floatingActionButton: FlatButton(
        child: Container(
          color: Colors.red,
          //height: 50,
            margin: EdgeInsets.fromLTRB(w*0.298,h*0.86,0,0),
            child: SvgPicture.asset("assets/SVG/get_started.svg" ),
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder:(_){
                return ThemePaletteScreen();
              } ));
        },
      ),*/

      body:SafeArea(
        child: Stack(
          children: [
            Container(

              //margin:EdgeInsets.only(right:0),
              //margin:EdgeInsets.only(left: h*0.25),
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  //color:Colors.red,
                  height: h*0.38,
                  width: w*0.74,
                  child: SvgPicture.asset("assets/SVG/rectangle_h.svg",fit:BoxFit.fill)),
            ),
            Container(
              width: w*0.48,
              height: h*0.07,
              margin: EdgeInsets.fromLTRB(w*0.25,h*0.29,0,0),
              child: SvgPicture.asset("assets/SVG/logo.svg",fit:BoxFit.fill,),
            ),
            Container(
              width: w*0.32,
              height: h*0.147,
              margin: EdgeInsets.fromLTRB(w*0.33,h*0.42,0,0),
              child: SvgPicture.asset("assets/SVG/groupe_rec.svg"),
            ),
            /*Container(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset("assets/SVG/rectangle_h.svg"),
            ),*/
            Container(
              //color: Colors.red,
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                //color: Colors.yellow,
                width: w*0.88,
                  height: h*0.41,
                  child: SvgPicture.asset("assets/SVG/rectangle_b.svg",fit:BoxFit.fill),
              ),
            ),
            Container(
              margin:EdgeInsets.fromLTRB(w*0.35,h*0.13, 0,0),
              child: Text(
                "welcome to",
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: h*0.024,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
        Container(
          //color: Colors.red,
          margin: EdgeInsets.fromLTRB(w*0.27,h*0.78,0,0),
          child: MaterialButton(
            //height: h*0.05,
            //minWidth: w*0.4,
            //color: Colors.red,
            /*shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12),
            ),*/
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder:(_){
                    return ThemePaletteScreen();
                  } ));
            },
            child: Container(
              width:w*0.4,
                height: h*0.05,
                child: SvgPicture.asset("assets/SVG/get_start.svg",fit:BoxFit.fill)),
          ),
        ),
      /*RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          //side: BorderSide(color: Colors.red)
        ),
        color: Colors.white,
        child: Text("Get stated >",style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),*/
             /*RaisedButton(

               child: Container(
                color: Colors.red,
                margin: EdgeInsets.fromLTRB(w*0.298,h*0.86,0,0),
                child: SvgPicture.asset("assets/SVG/get_started.svg" ),
            ),
               onPressed: (){
                 Navigator.of(context).push(MaterialPageRoute(
                     builder:(_){
                       return ThemePaletteScreen();
                     } ));
               },
             ),*/
          ],
        ),
      ),

    );
  }
}


/*
import 'package:color_palette0/screens/theme_palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StartScreen extends StatelessWidget {
  //The home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlatButton(
        child: Container(
          height: 50,
          alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 30),
            child: SvgPicture.asset("assets/SVG/get_started.svg",fit: BoxFit.cover, ),
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder:(_){
                return ThemePaletteScreen();
              } ));
        },
      ),

      body:Container(
        height: double.infinity,
        width: double.infinity,
        child:Image.asset("assets/PNG/start_screen.jpg",fit: BoxFit.cover,),
      ),

    );
  }
}

 */