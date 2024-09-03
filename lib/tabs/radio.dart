import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.only(
            top: 100.0,
          ),
          child: Image.asset("assets/images/radio_image.png")),
      SizedBox(
        height: 50,
      ),
      Text(
        "اذاعه القران الكريم",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 40,
        ),
        padding: EdgeInsets.only(
          left: 90,
        ),
        child: Row(
          children: [
            Icon(
              Icons.skip_previous,
              color: Theme.of(context).colorScheme.error,
              size: 40.0,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.play_arrow_sharp,
              color: Theme.of(context).colorScheme.error,
              size: 60.0,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.skip_next,
              color: Theme.of(context).colorScheme.error,
              size: 40.0,
            ),
          ],
        ),
      ),
    ]);
  }
}
