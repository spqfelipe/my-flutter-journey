import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif_explorer/Services/gif_service.dart';
import 'package:gif_explorer/UI/gif_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GifService gifService = GifService();

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
          onSubmitted: (text) {
            // Set state will force FutureBuilder to rebuild
            setState(() {
              gifService.setSearch(text);
              gifService.setOffset(0);
            });
          },
        ),
      );

  Widget _buildLoadMoreCell() => Container(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add,
                color: Colors.white,
                size: 70.0,
              ),
              Text(
                "More",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              )
            ],
          ),
          onTap: () {
            setState(() {
              gifService.incrementOffset(19);
            });
          },
        ),
      );

  Widget _buildGifTabel(BuildContext context, AsyncSnapshot snapshot) =>
      GridView.builder(
        padding: EdgeInsets.all(12.0),
        // ! Grid Delegate is responsible to setup how the data will be displayed inside
        // ! the grid itself
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: gifService.getCount(snapshot.data['data']),
        itemBuilder: (context, index) {
          if (!gifService.isSearch() || index < snapshot.data['data'].length) {
            return GestureDetector(
              child: Image.network(
                  snapshot.data['data'][index]['images']['fixed_height']['url'],
                  height: 300.0,
                  fit: BoxFit.cover),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GifPage(snapshot.data['data'][index]);
                }));
              },
            );
          } else {
            return _buildLoadMoreCell();
          }
        },
      );

  Widget _buildGifBody() => Expanded(
        child: FutureBuilder(
          future: gifService.getGifs(),
          builder: (context, snapshot) {
            // Verify the connection state to display propper data
            switch (snapshot.connectionState) {
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
                if (snapshot.hasError)
                  return Container();
                else
                  return _buildGifTabel(context, snapshot);
            }
          },
        ),
      );

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
            _buildGifBody(),
          ],
        ));
  }
}
