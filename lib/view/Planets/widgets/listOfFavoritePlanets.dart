import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/listViewTile.dart';
import 'package:flutter/material.dart';

class ListOfFavoritePlanets extends StatefulWidget {
  const ListOfFavoritePlanets({
    Key key,
    @required this.favoritePlanets,
  }) : super(key: key);
  final List<CharacterModel> favoritePlanets;
  @override
  _ListOfFavoritePlanetsState createState() => _ListOfFavoritePlanetsState();
}

class _ListOfFavoritePlanetsState extends State<ListOfFavoritePlanets> {
  @override
  Widget build(BuildContext context) {
    return listAllPlanets().isEmpty
        ? Text(TextStrings().noPlanFavorites)
        : ListView(
            children: listAllPlanets(),
          );
  }

  List<Widget> listAllPlanets() {
    return widget.favoritePlanets
        .map((e) => ListViewTile(
              res: e,
              type: TextStrings().characters,
            ))
        .toList();
  }
}
