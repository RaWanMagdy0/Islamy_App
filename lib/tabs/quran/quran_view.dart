import 'package:flutter/material.dart';

import '../../my_theme_data.dart';

class QuranView extends StatelessWidget {
  final String suraName;
  final String suraNumber;

  const QuranView(
      {super.key, required this.suraName, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            suraNumber,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 1.5,
          color: MyThemeData.primary,
          height: 30,
        ),
        Expanded(
            child: Text(
          suraName,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
