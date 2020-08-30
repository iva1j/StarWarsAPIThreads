import 'package:flutter/material.dart';

class ShipModel {
  String name, model, manufacturer, costInCredits, passengers, crew, length;
  bool favorite;

  ShipModel({
    @required this.name,
    @required this.model,
    @required this.manufacturer,
    @required this.costInCredits,
    @required this.passengers,
    @required this.crew,
    @required this.length,
    this.favorite = false,
  });

  void toggleFavorite() {
    favorite = !favorite;
  }
}
