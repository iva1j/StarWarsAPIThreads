import 'dart:collection';

import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:flutter/material.dart';

class CharactersModel extends ChangeNotifier {
  final List<CharacterModel> _characters = [];

  UnmodifiableListView<CharacterModel> get allCharacters =>
      UnmodifiableListView(_characters);
  UnmodifiableListView<CharacterModel> get favoriteCharacters =>
      UnmodifiableListView(
          _characters.where((character) => character.favorite));

  void addCharacter(CharacterModel character) {
    _characters.add(character);
    notifyListeners();
  }

  bool isCharactersEmpty() {
    return _characters.length == 0;
  }

  bool isFavoriteCharactersEmpty() {
    return _characters.where((element) => element.favorite).length == 0;
  }

  void clearCharacters() {
    _characters.clear();
    notifyListeners();
  }

  void toggleFavorite(CharacterModel character) {
    final characterIndex = _characters.indexOf(character);
    _characters[characterIndex].toggleFavorite();
    notifyListeners();
  }
}
