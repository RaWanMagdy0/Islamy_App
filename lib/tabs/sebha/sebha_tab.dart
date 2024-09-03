import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> text = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
  ];
  int currentIndex = 0;

  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    var size = MediaQuery.of(context).size;
    return Column(children: [
      SizedBox(
        height: 30,
      ),
      Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 100,
              top: 50,
            ),
            child: Transform.rotate(
                angle: angle,
                child: Theme(
                  data: ThemeData(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: InkWell(
                      onTap: () {
                        ClickOnImage();
                      },
                      child: Image.asset(
                        provider.theme == ThemeMode.light
                            ? "assets/images/body_of_seb7a.png"
                            : "assets/images/dark_body_of_seb7a.png",
                        height: size.height * 0.20,
                      )),
                )),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 130,
            ),
            child: Image.asset(
              provider.theme == ThemeMode.light
                  ? "assets/images/head_of_seb7a.png"
                  : "assets/images/dark_head_of_seb7a.png",
              height: size.height * 0.10,
            ),
          ),
        ],
      ),
      SizedBox(
        height: 25,
      ),
      Container(
          margin: EdgeInsets.only(
            left: 100,
          ),
          child: Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.bodyLarge,
          )),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 100, top: 20.0),
        width: 69,
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "$counter",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
      Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: InkWell(
          onTap: () {
            ClickOnImage();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 30,
              left: 100.0,
            ),
            width: 130,
            height: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              text[currentIndex],
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }

  void ClickOnImage() {
    angle += 3;
    if (counter == 33) {
      counter = 0;
      currentIndex++;
      if (currentIndex > 2) {
        currentIndex = 0;
      }
    }
    counter++;

    setState(() {});
  }
}
