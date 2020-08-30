import 'package:flutter/material.dart';

class CharacterModel {
  String name, height, hairColor, skinColor, eyeColor, birthYear, gender;
  bool favorite;

  CharacterModel({
    @required this.name,
    @required this.height,
    @required this.hairColor,
    @required this.skinColor,
    @required this.eyeColor,
    @required this.birthYear,
    @required this.gender,
    this.favorite = false,
  });

  void toggleFavorite() {
    favorite = !favorite;
  }
}
