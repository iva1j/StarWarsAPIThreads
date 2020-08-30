import 'package:flutter/material.dart';

class PlanetModel {
  String name,
      population,
      terrain,
      gravity,
      diameter,
      orbitalPeriod,
      rotationPeriod;
  bool favorite;

  PlanetModel({
    @required this.name,
    @required this.population,
    @required this.terrain,
    @required this.gravity,
    @required this.diameter,
    @required this.orbitalPeriod,
    @required this.rotationPeriod,
    this.favorite = false,
  });

  void toggleFavorite() {
    favorite = !favorite;
  }
}
