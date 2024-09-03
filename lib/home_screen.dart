import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/hadeth/hadeth_tab.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/tabs/setting/setting_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Stack(
      children: [
        Image.asset(
          provider.theme == ThemeMode.light
              ? "assets/images/background.png"
              : "assets/images/bg.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              index = value;
              setState(() {});
            },
            currentIndex: index,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/quran.png")),
                  label: "quran",
                  backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                  label: "sebha",
                  backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/radio.png")),
                  label: "radio",
                  backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                      AssetImage("assets/images/quran-quran-svgrepo-com.png")),
                  label: "ahadeth",
                  backgroundColor: Theme.of(context).colorScheme.primary),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "settings",
                  backgroundColor: Theme.of(context).colorScheme.primary),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab(),
  ];
}
