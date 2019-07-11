import 'package:flutter/material.dart';
import "dart:convert";
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  String _offset;

  Future<Map>_getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get("https://api.giphy.com/v1/gifs/trending?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&limit=20&rating=G");
    else
      response = await http.get("https://api.giphy.com/v1/gifs/search?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }
  @override
  void initState() { 
    super.initState();

    _getGifs().then(map){
      print(map);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}