import 'package:StarWarsAPIThreads/model/planetModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  const PlanetDetails({
    Key key,
    @required this.details,
  }) : super(key: key);

  final PlanetModel details;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Population: ' + details.population),
              Text('Terrain: ' + details.terrain),
              Text('Gravity: ' + details.gravity),
              Divider()
            ],
          ),
          VerticalDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Diameter: ' + details.diameter),
              Text('Orbital_period: ' + details.orbitalPeriod),
              Text('Rotation_period: ' + details.rotationPeriod),
              Divider()
            ],
          ),
        ],
      ),
    );
  }
}
