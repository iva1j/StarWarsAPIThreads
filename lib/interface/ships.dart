import 'dart:isolate';

import 'package:StarWarsAPIThreads/model/people.dart';

abstract class ShipsInterface {
  Future<StarWarsModel> createIsolate();
  static isolateFunction(SendPort mainSendPort)=>(){};
}
