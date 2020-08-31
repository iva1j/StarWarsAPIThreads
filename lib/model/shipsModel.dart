import 'dart:collection';

import 'package:StarWarsAPIThreads/model/shipModel.dart';
import 'package:flutter/material.dart';

class ShipsModel extends ChangeNotifier {
  final List<ShipModel> _ships = [];

  UnmodifiableListView<ShipModel> get allShips => UnmodifiableListView(_ships);
  UnmodifiableListView<ShipModel> get favoriteShips =>
      UnmodifiableListView(_ships.where((ship) => ship.favorite));

  bool isShipsEmpty() {
    return _ships.length == 0;
  }

  bool isFavoriteShipsEmpty() {
    return _ships.where((element) => element.favorite).length == 0;
  }

  void addShip(ShipModel ship) {
    _ships.add(ship);
    notifyListeners();
  }

  void clearShips() {
    _ships.clear();
    notifyListeners();
  }

  void toggleFavorite(ShipModel ship) {
    final shipIndex = _ships.indexOf(ship);
    _ships[shipIndex].toggleFavorite();
    notifyListeners();
  }
}
