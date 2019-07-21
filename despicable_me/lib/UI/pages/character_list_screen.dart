import 'package:despicable_me/UI/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:despicable_me/styleguide.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  // Builds title
  Widget _buildTitle() => Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 5.0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Despicable Me",
              style: AppTheme.display1,
            ),
            Text(
              "Characters",
              style: AppTheme.display2,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildTitle(),
            Expanded(
              child: CharacterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
