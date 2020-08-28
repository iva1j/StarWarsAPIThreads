import 'dart:isolate';

import 'package:StarWarsAPIThreads/model/people.dart';

abstract class CharactersInterface {
  Future<People> createIsolate();
  static isolateFunction(SendPort mainSendPort)=>(){};
}
