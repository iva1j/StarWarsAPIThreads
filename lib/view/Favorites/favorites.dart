import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextStrings().favorites),
      ),
      body: Center(
        child: Text(TextStrings().favoritesList),
      ),
    );
  }
}
