import 'dart:isolate';

import 'package:StarWarsAPIThreads/model/people.dart';

abstract class PlanetsInterface {
  Future<StarWarsModel> createIsolate();
  static isolateFunction(SendPort mainSendPort)=>(){};
}
