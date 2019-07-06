import 'package:flutter/material.dart';

// Building HomeScreen on its own file just to keep things organized 

class HomeScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Builds TextField with different label
  Widget _buildTextField(String label) => TextField(
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20.0,),
      decoration: InputDecoration(
        labelText: label,
      ),
    );

  Widget _buildProcessButton() => Padding(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    child: Container(
      height: 50.0,
      child: RaisedButton(
        color: ThemeData.dark().primaryColor,
        child: Text("Process",
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), 
        ),
        onPressed: () {},
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {print("okokok");},
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
            //
            // Stretch will extend all widgets inside
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0,),
              Text("Fill in your info: ", 
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTextField("Weight (Kg)"),
              _buildTextField("Height (cm)"),
              _buildProcessButton(),
            ],
          )
        ),
      ),
    );
  }
}