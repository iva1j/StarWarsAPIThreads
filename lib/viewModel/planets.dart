import 'dart:convert';
import 'dart:isolate';
import 'package:StarWarsAPIThreads/interface/planets.dart';
import 'package:StarWarsAPIThreads/model/people.dart';
import 'package:StarWarsAPIThreads/utils/globalVariables.dart';
import 'package:http/http.dart' as http;


void initPlanMethod() {
  GetStarWarsPlanets().createIsolate();
  getPlanets = GetStarWarsPlanets().createIsolate();
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
