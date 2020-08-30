import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/listViewTile.dart';
import 'package:flutter/material.dart';

class ListOfCharacters extends StatefulWidget {
  const ListOfCharacters({
    Key key,
    @required this.characters,
    @required this.generatingFavorites,
  }) : super(key: key);

  final List<CharacterModel> characters;
  final bool generatingFavorites;
  @override
  _ListOfCharactersState createState() => _ListOfCharactersState();
}

class _ListOfCharactersState extends State<ListOfCharacters> {
  @override
  Widget build(BuildContext context) {
    return widget.generatingFavorites
        ? listAllCharacters().isEmpty
            ? Container()
            : ListView(
                children: listAllCharacters(),
              )
        : listAllCharacters().isEmpty
            ? CircularProgressIndicator()
            : ListView(
                children: listAllCharacters(),
              );
  }

  List<Widget> listAllCharacters() {
    return widget.characters
        .map((e) => ListViewTile(
              res: e,
              type: TextStrings().characters,
            ))
        .toList();
  }
}
