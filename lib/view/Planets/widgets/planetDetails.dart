import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  const PlanetDetails({
    Key key,
    @required this.names,
    @required this.index,
  }) : super(key: key);

  final names;
  final int index;

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
              Text('Population: ' + names[index]['population'].toString()),
              Text('Terrain: ' + names[index]['terrain'].toString()),
              Text('Gravity: ' + names[index]['gravity'].toString()),
              Divider()
            ],
          ),
          VerticalDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Diameter: ' + names[index]['diameter'].toString()),
              Text('Orbital_period: ' +
                  names[index]['orbital_period'].toString()),
              Text('Rotation_period: ' +
                  names[index]['rotation_period'].toString()),
              Divider()
            ],
          ),
        ],
      ),
    );
  }
}
