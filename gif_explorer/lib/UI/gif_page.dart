import "package:flutter/material.dart";
import 'package:share/share.dart';

// ############################
// ######### GifPage ##########
// ############################
// Show details for single gif

class GifPage extends StatelessWidget {
    
  // Holds the data from a specific gif
  // Note: has to be final the its stateless
  final Map _gifData;

  // Constructor
  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share(_gifData["images"]["fixed_height"]["url"]);
          },)
        ],
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
