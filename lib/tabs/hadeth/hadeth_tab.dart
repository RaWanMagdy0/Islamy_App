import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../my_theme_data.dart';
import 'hadeth_details.dart';
import 'hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    LoadHadeth();
    return Column(
      children: [
        Image.asset("assets/images/ahadeth_image.png"),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
          height: 6,
        ),
        Row(children: [
          Expanded(
              child: Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          )),
          Container(
            width: 1.5,
            color: MyThemeData.primary,
            height: 40,
          ),
        ]),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
          height: 6,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              endIndent: 40,
              indent: 40,
              thickness: 1,
              color: MyThemeData.primary,
            ),
            itemBuilder: (context, index) {
              return Center(
                  child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    HadethDetails.routName,
                    arguments: allAhadeth[index],
                  );
                },
                child: Text(
                  allAhadeth[index].title,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ));
            },
            itemCount: allAhadeth.length,
          ),
        )
      ],
    );
  }

  LoadHadeth() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
      setState(() {
        print("string");
      });
    }).catchError((e) {
      print(e.toString());
    });
  }
}
