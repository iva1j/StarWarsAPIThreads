import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:flutter/cupertino.dart';

class TextStrings {
  String planets = 'Planets';
  String characters = 'Characters';
  String ships = 'Ships';
  String charlist = 'List of characters';
  String planList = 'List of planets';
  String starWars = 'Star Wars';
  String shipsList = 'List of ships';
  String favoritesList = "List of favorites";
  String favorites = 'Favorites';
  String noCharFavorites = "Nema karaktera u favoritima";
  String noPlanFavorites = "Nema planeta u favoritima";
  String noShipFavorites = "Nema brodova u favoritima";
  String favoriteChars = "Favorite characters";
  String favoritePlanets = "Favorite planets";
  String favoriteShips = "Favorite ships";
}

class BottomNavbarIconURLs {
  String yoda = 'assets/images/yoda.png';
  String planet = 'assets/images/planet.png';
  String starship = 'assets/images/star-wars.png';
  String background = 'assets/images/bg.jpg';
}

class FutureBuilderStrings {
  String error(AsyncSnapshot<StarWarsModel> name) =>
      "${name.error}neki tamo error kojeg hvala Bogu nikad neeeeeema!";
}
