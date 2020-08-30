import 'package:StarWarsAPIThreads/utils/sizeconfig.dart';
import 'package:flutter/material.dart';

class FavoriteCategoryTitle extends StatelessWidget {
  final String displayString;
  const FavoriteCategoryTitle({
    Key key,
    @required this.displayString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.lightGreen,
      ),
      height: SizeConfig.blockSizeVertical * 7,
      width: SizeConfig.blockSizeVertical * 100,
      child: Center(
        child: Text(
          displayString,
          style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
