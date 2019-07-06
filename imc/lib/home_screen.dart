import 'package:flutter/material.dart';

// Creating HomeScreen on individual file

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          //
          // Stretch will extend all widgets inside
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person, size: 120.0,),
            //
            // TextInputType will define the keyboard and input type for the field
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (Kg)",
              ),
              )
          ],
        ),
      ),
    );
  }
}