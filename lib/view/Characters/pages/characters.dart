import 'package:StarWarsAPIThreads/view/Characters/widgets/backgroundImage.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/listOfCharacters.dart';
import 'package:StarWarsAPIThreads/viewModel/characters.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:flutter/material.dart';

class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  void initState() {
    initCharMethod();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(TextStrings().charactets),
        ),
        body: Center(
          child: ListOfCharacters(),
        ),
      ),
    );
  }
}
