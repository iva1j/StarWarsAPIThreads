import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/listViewTile.dart';
import 'package:flutter/material.dart';

class ListOfFavoriteCharacters extends StatefulWidget {
  const ListOfFavoriteCharacters({
    Key key,
    @required this.favoriteCharacters,
  }) : super(key: key);
  final List<CharacterModel> favoriteCharacters;
  @override
  _ListOfFavoriteCharactersState createState() =>
      _ListOfFavoriteCharactersState();
}

class _ListOfFavoriteCharactersState extends State<ListOfFavoriteCharacters> {
  @override
  Widget build(BuildContext context) {
    return listAllCharacters().isEmpty
        ? Text(TextStrings().noCharFavorites)
        : ListView(
            children: listAllCharacters(),
          );
  }

  List<Widget> listAllCharacters() {
    return widget.favoriteCharacters
        .map((e) => ListViewTile(
              res: e,
              type: TextStrings().characters,
            ))
        .toList();
  }
}
