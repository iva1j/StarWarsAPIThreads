import 'dart:convert';
import 'dart:isolate';
import 'package:StarWarsAPIThreads/interface/ships.dart';
import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/model/shipModel.dart';
import 'package:StarWarsAPIThreads/model/shipsModel.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void initShipsMethod() {
  GetStarWarsShips().createIsolate();
  getShips = GetStarWarsShips().createIsolate();
}

void initShips(BuildContext context) {
  initShipsMethod();

  getShips.then((value) {
    Provider.of<ShipsModel>(context, listen: false).clearShips();

    for (final x in value.results) {
      final ShipModel ship = ShipModel(
          name: x['name'],
          model: x['model'],
          manufacturer: x['manufacturer'],
          costInCredits: x['cost_in_credits'],
          passengers: x['passengers'],
          crew: x['crew'],
          length: x['length']);
      Provider.of<ShipsModel>(context, listen: false).addShip(ship);
    }
  });
}

class GetStarWarsShips extends ShipsInterface {
  @override
  Future<StarWarsModel> createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(isolateFunction, receivePort.sendPort);
    SendPort childSendPort = await receivePort.first;
    ReceivePort responsePort = ReceivePort();
    childSendPort
        .send(["https://swapi.dev/api/starships/", responsePort.sendPort]);
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
