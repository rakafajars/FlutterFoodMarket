import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RatinStars extends StatelessWidget {
  final double rate;

  const RatinStars({Key key, this.rate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int numberOfStars = rate.round();
    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? MdiIcons.star : MdiIcons.starOutline,
              size: 16,
              color: mainColor,
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: textFontWeight400.copyWith(
                color: greyColor,
                fontSize: 12,
              ),
            ),
          ],
    );
  }
}
