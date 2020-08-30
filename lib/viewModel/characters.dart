import 'dart:convert';
import 'dart:isolate';
import 'package:StarWarsAPIThreads/interface/characters.dart';
import 'package:StarWarsAPIThreads/model/characterModel.dart';
import 'package:StarWarsAPIThreads/model/charactersModel.dart';
import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void initCharMethod() {
  GetStarWarsChar().createIsolate();
  getCharacters = GetStarWarsChar().createIsolate();
}

void initCharacters(BuildContext context) {
  initCharMethod();

  getCharacters.then((value) {
    Provider.of<CharactersModel>(context, listen: false).clearCharacters();

    for (final x in value.results) {
      final CharacterModel character = CharacterModel(
          name: x['name'],
          height: x['height'],
          hairColor: x['hair_color'],
          skinColor: x['skin_color'],
          eyeColor: x['eye_color'],
          birthYear: x['birth_year'],
          gender: x['gender']);
      Provider.of<CharactersModel>(context, listen: false)
          .addCharacter(character);
    }
  });
}

class GetStarWarsChar extends CharactersInterface {
  Future<StarWarsModel> createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(isolateFunction, receivePort.sendPort);
    SendPort childSendPort = await receivePort.first;
    ReceivePort responsePort = ReceivePort();
    childSendPort
        .send(["https://swapi.dev/api/people/", responsePort.sendPort]);
    var response = await responsePort.first;
    return response;
  }

  static isolateFunction(SendPort mainSendPort) async {
    ReceivePort childReceivePort = ReceivePort();
    mainSendPort.send(childReceivePort.sendPort);

    await for (var message in childReceivePort) {
      String url = message[0];
      SendPort replyPort = message[1];
      var response = await http.get(url);
      return replyPort.send(StarWarsModel.fromJson(jsonDecode(response.body)));
    }
  }
}
