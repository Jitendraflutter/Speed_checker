import 'package:flutter/material.dart';


class TestingUnitsWidget extends StatelessWidget {
  const TestingUnitsWidget({
   this.title,
    this.unit,
    this.digit,
   this.iconData,
     this.iconColor,
    this.isDownload,
    this.crossAxisAlignment,
  });

  final CrossAxisAlignment ?crossAxisAlignment;
  final IconData? iconData;
  final Color? iconColor;
  final String ?title;
  final String ?digit;
  final String ?unit;
  final bool ?isDownload;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' $title',
              style: textTheme.bodyMedium!.copyWith(
                fontSize: isDownload! ? 25 : 15,
                fontWeight: isDownload! ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          // todo align text to baseline
          children: <Widget>[
            Text(
              digit??"",
              style: isDownload!
                  ? textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,

              )
                  : textTheme.headlineLarge!,
            ),
            // todo align text to bottom of the line
            Text(
              unit??"",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}