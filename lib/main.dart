import 'package:color_palette0/screens/controler.dart';
import 'package:color_palette0/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'palette.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create:(_)=> Palettes(),
    child:MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
      //home: Test_API(),
      theme: ThemeData(
        fontFamily: "Roboto",

      ),
      //home: MySlider(),
    );
  }
}
