import 'package:flutter/cupertino.dart';
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

  // Widgets Functions

  Widget _buildSearchField() => Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: "Search",
              labelStyle: TextStyle(color: Colors.white, fontSize: 18.0),
              border: OutlineInputBorder()),
          style: TextStyle(color: Colors.white, fontSize: 20.0),
          textAlign: TextAlign.center,
          onSubmitted: (text){
            // Set state will force FutureBuilder to rebuild
            setState(() {
              _search = text;
            });
          },
        ),
      );

  Widget _buildGifTabel(BuildContext context, AsyncSnapshot snapshot) => GridView.builder(
      padding: EdgeInsets.all(12.0),
      // ! Grid Delegate is responsible to setup how the data will be displayed inside 
      // ! the grid itself 
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemCount: 4,
      itemBuilder: (context, index){
        return GestureDetector(
          child: Image.network(snapshot.data['data'][index]['images']['fixed_height']['url'],
          height: 300.0,
          fit: BoxFit.cover
          ),
        );
      },
  );

  // ! API functions -- Remove later

  Future<Map> _getGifs() async {
    http.Response response;

    if (_search == null)
      response = await http.get(
          "https://api.giphy.com/v1/gifs/trending?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&limit=20&rating=G");
    else
      response = await http.get(
          "https://api.giphy.com/v1/gifs/search?api_key=CkYNcuKD69Vsr3rqJPILiWEsBe9ffoGP&q=$_search&limit=25&offset=$_offset&rating=G&lang=en");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    // _getGifs().then((map) {
    //   print(map);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Image.asset("assets/images/title.gif"),
        ),
        body: Column(
          children: <Widget>[
            _buildSearchField(),
            Expanded(
              child: FutureBuilder(
                future: _getGifs(),
                builder: (context, snapshot){
                  // Verify the connection state to display propper data
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        height: 300.0,
                        width: 300.0,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 4.0,
                        ),
                      );
                    default:
                      if(snapshot.hasError) return Container();
                      else return _buildGifTabel(context, snapshot);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
