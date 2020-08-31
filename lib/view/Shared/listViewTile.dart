import 'package:StarWarsAPIThreads/model/charactersModel.dart';
import 'package:StarWarsAPIThreads/model/planetsModel.dart';
import 'package:StarWarsAPIThreads/model/shipsModel.dart';
import 'package:StarWarsAPIThreads/utils/colors.dart';
import 'package:StarWarsAPIThreads/utils/strings.dart';
import 'package:StarWarsAPIThreads/view/Characters/widgets/charactersDetails.dart';
import 'package:StarWarsAPIThreads/view/Planets/widgets/planetDetails.dart';
import 'package:StarWarsAPIThreads/view/Ships/widgets/shipDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewTile extends StatelessWidget {
  const ListViewTile({
    Key key,
    @required this.res,
    @required this.type,
  }) : super(key: key);

  final res;
  final String type;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Icon(Icons.arrow_drop_down_circle),
      backgroundColor: favTitlesColor,
      leading: IconButton(
          icon:
              res.favorite == true ? Icon(Icons.star) : Icon(Icons.star_border),
          onPressed: () {
            type == TextStrings().characters
                ? Provider.of<CharactersModel>(context, listen: false)
                    .toggleFavorite(res)
                : type == TextStrings().planets
                    ? Provider.of<PlanetsModel>(context, listen: false)
                        .toggleFavorite(res)
                    : Provider.of<ShipsModel>(context, listen: false)
                        .toggleFavorite(res);
          }),
      title: Text(res.name),
      children: <Widget>[
        type == TextStrings().characters
            ? CharactersDetails(details: res)
            : type == TextStrings().planets
                ? PlanetDetails(details: res)
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ShipsDetails(details: res),
                  ),
      ],
    );
  }
}
