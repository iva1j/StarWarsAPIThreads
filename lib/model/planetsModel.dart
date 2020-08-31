import 'dart:collection';

import 'package:StarWarsAPIThreads/model/planetModel.dart';
import 'package:flutter/material.dart';

class PlanetsModel extends ChangeNotifier {
  final List<PlanetModel> _planets = [];

  UnmodifiableListView<PlanetModel> get allPlanets =>
      UnmodifiableListView(_planets);
  UnmodifiableListView<PlanetModel> get favoritePlanets =>
      UnmodifiableListView(_planets.where((planet) => planet.favorite));

  bool isPlanetsEmpty() {
    return _planets.length == 0;
  }

  bool isFavoritePlanetsEmpty() {
    return _planets.where((element) => element.favorite).length == 0;
  }

  void addPlanet(PlanetModel planet) {
    _planets.add(planet);
    notifyListeners();
  }

  void clearPlanets() {
    _planets.clear();
    notifyListeners();
  }

  void toggleFavorite(PlanetModel planet) {
    final planetIndex = _planets.indexOf(planet);
    _planets[planetIndex].toggleFavorite();
    notifyListeners();
  }
}
