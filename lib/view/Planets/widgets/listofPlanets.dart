import 'package:StarWarsAPIThreads/model/planetModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/listViewTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfPlanets extends StatefulWidget {
  const ListOfPlanets({
    Key key,
    @required this.planets,
    @required this.generatingFavorites,
  }) : super(key: key);

  final List<PlanetModel> planets;
  final bool generatingFavorites;
  @override
  _ListOfPlanetsState createState() => _ListOfPlanetsState();
}

class _ListOfPlanetsState extends State<ListOfPlanets> {
  @override
  Widget build(BuildContext context) {
    return widget.generatingFavorites
        ? listAllPlanets().isEmpty
            ? Container()
            : ListView(
                children: listAllPlanets(),
              )
        : listAllPlanets().isEmpty
            ? CircularProgressIndicator()
            : ListView(
                children: listAllPlanets(),
              );
  }

  List<Widget> listAllPlanets() {
    return widget.planets
        .map((e) => ListViewTile(
              res: e,
              type: TextStrings().planets,
            ))
        .toList();
  }
}
