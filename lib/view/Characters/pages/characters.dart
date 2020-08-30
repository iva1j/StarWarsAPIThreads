import 'package:StarWarsAPIThreads/view/Characters/widgets/backgroundImage.dart';
import 'package:StarWarsAPIThreads/model/charactersModel.dart';
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
    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Characters"),
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
      ),
    );
  }
}
