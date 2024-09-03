import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs/setting/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../my_theme_data.dart';
import '../../providers/my_provider.dart';
import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var pro = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              height: 50,
              width: mediaQuery.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: MyThemeData.primary,
                    width: 1.2,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro.locale == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.thememode,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 12,
              ),
              height: 50,
              width: mediaQuery.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: MyThemeData.primary,
                    width: 1.2,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pro.theme == ThemeMode.dark
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      });
}

void showThemeBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return themeBottomSheet();
      });
}
