import 'package:flutter/material.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:provider/provider.dart';

import '../../my_theme_data.dart';
import '../../providers/my_provider.dart';
import '../../providers/sura_details_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => SuraDetailsProvider()..readFiles(args.suranumber),
      builder: (context, child) {
        var provider = Provider.of<SuraDetailsProvider>(context);
        var pro = Provider.of<MyProvider>(context);

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  pro.theme == ThemeMode.dark
                      ? "assets/images/darkback.png"
                      : "assets/images/background.png",
                ),
                fit: BoxFit.cover),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                ("اسلامي"),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 15,
              ),
              margin:
                  EdgeInsets.only(top: 20, bottom: 120, left: 30, right: 30),
              width: mediaQuery.width,
              height: mediaQuery.height,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(
                    30,
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "  سوره ${args.suraname}",
                        style: theme.textTheme.bodySmall,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Icon(
                          Icons.play_circle,
                          size: 32,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: MyThemeData.primary,
                    indent: 30,
                    endIndent: 30,
                    thickness: 1.2,
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        "(${index + 1})${provider.verses[index]}",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodySmall,
                      );
                    },
                    itemCount: provider.verses.length,
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
