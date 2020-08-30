import 'dart:convert';
import 'dart:isolate';
import 'package:StarWarsAPIThreads/interface/planets.dart';
import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/model/planetModel.dart';
import 'package:StarWarsAPIThreads/model/planetsModel.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void initPlanMethod() {
  GetStarWarsPlanets().createIsolate();
  getPlanets = GetStarWarsPlanets().createIsolate();
}

void initPlanets(BuildContext context) {
  initPlanMethod();

  getPlanets.then((value) {
    Provider.of<PlanetsModel>(context, listen: false).clearPlanets();

    for (final x in value.results) {
      final PlanetModel planet = PlanetModel(
          name: x['name'],
          population: x['population'],
          terrain: x['terrain'],
          gravity: x['gravity'],
          diameter: x['diameter'],
          orbitalPeriod: x['orbital_period'],
          rotationPeriod: x['rotation_period']);
      Provider.of<PlanetsModel>(context, listen: false).addPlanet(planet);
    }
  });
}

class GetStarWarsPlanets extends PlanetsInterface {
  @override
  Future<StarWarsModel> createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    Isolate.spawn(isolateFunction, receivePort.sendPort);
    SendPort childSendPort = await receivePort.first;
    ReceivePort responsePort = ReceivePort();
    childSendPort
        .send(["https://swapi.dev/api/planets/", responsePort.sendPort]);
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
