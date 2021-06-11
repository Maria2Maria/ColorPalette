import 'package:color_palette0/screens/theme_palette_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      body:SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                  height: h*0.38,
                  width: w*0.74,
                  child: SvgPicture.asset("assets/SVG/rectangle_h.svg",fit:BoxFit.fill),
              ),
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
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
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
          margin: EdgeInsets.fromLTRB(w*0.27,h*0.78,0,0),
          child: MaterialButton(
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