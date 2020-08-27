import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:flutter/material.dart';

class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextStrings().charactets),
      ),
      body: Center(
        child: Text(TextStrings().charlist),
      ),
    );
  }
}
