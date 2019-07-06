import 'package:flutter/material.dart';

// Building HomeScreen on its own file just to keep things organized 

class HomeScreen extends StatefulWidget {

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // ############################
  // ##### CLASS ATTRIBUTES #####
  // ############################

  // ! Controllers
  // Controllers are responsible to control text input 
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoLabel = "";

  // ###########################
  // ##### LOGIC FUNCTIONS #####
  // ###########################

  void _resetFields(){
    // ! Controllers dont need to setState
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoLabel = "";
    });
  }

  // ! SetState
  void _calculate(){ 
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;
      double bmi = weight / (height * height);
      _infoLabel = "${bmi.toStringAsPrecision(4)}";
      
    });
    
  }

  // #####################################
  // ##### WIDGET BUILDING FUNCTIONS #####
  // #####################################

  // Builds TextField with different label
  Widget _buildTextField(String label, TextEditingController controller) => TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: 20.0,),
      decoration: InputDecoration(
        labelText: label,
      ),
    );

  // Builds RaisedButton with padding 
  Widget _buildProcessButton() => Padding(
    padding: EdgeInsets.symmetric(vertical: 15.0),
    child: Container(
      height: 50.0,
      child: RaisedButton(
        color: ThemeData.dark().primaryColor,
        child: Text("Process",
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold), 
        ),
        onPressed: _calculate,
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
            onPressed: _resetFields,
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
              _buildTextField("Weight (Kg)", weightController),
              _buildTextField("Height (cm)", heightController),
              _buildProcessButton(),
              Text("Results: " + _infoLabel,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold), 
              )
            ],
          )
        ),
      ),
    );
  }
}