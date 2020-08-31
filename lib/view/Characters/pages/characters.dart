import 'package:StarWarsAPIThreads/model/charactersModel.dart';
import 'package:StarWarsAPIThreads/utils/colors.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/listOfCharacters.dart';
import 'package:StarWarsAPIThreads/viewModel/characters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Characters extends StatefulWidget {
  @override
  _CharactersState createState() => _CharactersState();
}

class _CharactersState extends State<Characters> {
  @override
  void initState() {
    if (Provider.of<CharactersModel>(context, listen: false)
        .isCharactersEmpty()) initCharacters(context);

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("Characters"),
        backgroundColor: barColor,
      ),
      body: Container(
        child: Center(
          child: Consumer<CharactersModel>(
            builder: (context, characters, child) => ListOfCharacters(
              characters: characters.allCharacters,
              generatingFavorites: false,
            ),
          ),
        ),
      ),
    );
  }
}
