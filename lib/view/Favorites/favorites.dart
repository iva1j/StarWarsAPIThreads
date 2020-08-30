import 'package:StarWarsAPIThreads/model/charactersModel.dart';
import 'package:StarWarsAPIThreads/model/planetsModel.dart';
import 'package:StarWarsAPIThreads/model/shipsModel.dart';
import 'package:StarWarsAPIThreads/utils/sizeconfig.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/backgroundImage.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/listOfCharacters.dart';
import 'package:StarWarsAPIThreads/view/Favorites/favoriteCategoryTitle.dart';
import 'package:StarWarsAPIThreads/view/Planets/widgets/listofPlanets.dart';
import 'package:StarWarsAPIThreads/view/Ships/widgets/listOfShips.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: backgroundImage(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(TextStrings().favorites),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockSizeVertical * 0.5,
              ),
              FavoriteCategoryTitle(displayString: TextStrings().favoriteChars),
              Expanded(
                child: Consumer<CharactersModel>(
                  builder: (context, characters, child) => ListOfCharacters(
                    characters: characters.favoriteCharacters,
                    generatingFavorites: true,
                  ),
                ),
              ),
              FavoriteCategoryTitle(
                  displayString: TextStrings().favoritePlanets),
              Expanded(
                child: Consumer<PlanetsModel>(
                  builder: (context, planets, child) => ListOfPlanets(
                    planets: planets.favoritePlanets,
                    generatingFavorites: true,
                  ),
                ),
              ),
              FavoriteCategoryTitle(displayString: TextStrings().favoriteShips),
              Expanded(
                child: Consumer<ShipsModel>(
                  builder: (context, ships, child) => ListOfShips(
                    ships: ships.favoriteShips,
                    generatingFavorites: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
