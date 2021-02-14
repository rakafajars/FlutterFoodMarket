import 'package:flutter/material.dart';
import 'package:flutter_food_market/shared/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:relative_scale/relative_scale.dart';

class RatinStars extends StatefulWidget {
  final double rate;

  const RatinStars({Key key, this.rate}) : super(key: key);

  @override
  _RatinStarsState createState() => _RatinStarsState();
}

class _RatinStarsState extends State<RatinStars> with RelativeScale {
  @override
  Widget build(BuildContext context) {
    int numberOfStars = widget.rate.round();
    initRelativeScaler(context);

    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? MdiIcons.star : MdiIcons.starOutline,
              size: sy(14),
              color: mainColor,
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              widget.rate.toString(),
              style: textFontWeight400.copyWith(
                color: greyColor,
                fontSize: sy(12),
              ),
            ),
          ],
    );
  }
}
