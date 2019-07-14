import "package:flutter/material.dart";

class GifPage extends StatelessWidget {
  
  // ! Needs to be final as this widget is Statless
  final Map _gifData;

  // ! Constructor to pass data
  GifPage(this._gifData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"]),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
