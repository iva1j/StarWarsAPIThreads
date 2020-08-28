import 'dart:convert';
import 'dart:isolate';
import 'package:StarWarsAPIThreads/interface/characters.dart';
import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:http/http.dart' as http;

void initCharMethod() {
  GetStarWarsChar().createIsolate();
  getCharacters = GetStarWarsChar().createIsolate();
}

class GetStarWarsChar extends CharactersInterface {
  Future<People> createIsolate() async {
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
      return replyPort.send(People.fromJson(jsonDecode(response.body)));
    }
  }
}
