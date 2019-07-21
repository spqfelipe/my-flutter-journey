import 'package:flutter/material.dart';
import 'UI/pages/character_list_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Despicable Me",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          // Elevation removes shadow
          elevation: 0,
        )
      ),
      home: CharacterListScreen(),
    );
  }
}