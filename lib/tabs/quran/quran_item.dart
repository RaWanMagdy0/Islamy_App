import 'package:flutter/material.dart';

import '../../my_theme_data.dart';

class QuranItem extends StatelessWidget {
  const QuranItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "رقم السوره",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        )),
        Container(
          width: 1.5,
          color: MyThemeData.primary,
          height: 45,
        ),
        Expanded(
            child: Text(
          "اسم السوره",
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
