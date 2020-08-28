import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:flutter/cupertino.dart';

class TextStrings {
  String planets = 'Planets';
  String charactets = 'Characters';
  String ships = 'Ships';
  String charlist = 'List of characters';
  String planList = 'List of planets';
  String starWars = 'Star Wars';
  String shipsList = 'List of ships';
  String favoritesList = "List of favorites";
  String favorites = 'Favorites';
}

class BottomNavbarIconURLs {
  String yoda = 'assets/images/yoda.png';
  String planet = 'assets/images/planet.png';
  String starship = 'assets/images/star-wars.png';
}

class FutureBuilderStrings {
  String error(AsyncSnapshot<People> name) =>
      "${name.error}neki tamo error kojeg hvala Bogu nikad neeeeeema!";
}
