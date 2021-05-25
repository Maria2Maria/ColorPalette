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
        //color: Colors.red,
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
