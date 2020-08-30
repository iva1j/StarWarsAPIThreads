import 'package:StarWarsAPIThreads/model/shipModel.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Shared/listViewTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfShips extends StatefulWidget {
  const ListOfShips({
    Key key,
    @required this.ships,
    @required this.generatingFavorites,
  }) : super(key: key);

  final List<ShipModel> ships;
  final bool generatingFavorites;
  @override
  _ListOfShipsState createState() => _ListOfShipsState();
}

class _ListOfShipsState extends State<ListOfShips> {
  @override
  Widget build(BuildContext context) {
    return widget.generatingFavorites
        ? listAllShips().isEmpty
            ? Container()
            : ListView(
                children: listAllShips(),
              )
        : listAllShips().isEmpty
            ? CircularProgressIndicator()
            : ListView(
                children: listAllShips(),
              );
  }

  List<Widget> listAllShips() {
    return widget.ships
        .map((e) => ListViewTile(
              res: e,
              type: TextStrings().ships,
            ))
        .toList();
  }
}
