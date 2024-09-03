import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme_data.dart';
import '../../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.locale == "en"
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).colorScheme.onSecondary),
                ),
                provider.locale == "en"
                    ? Icon(
                        Icons.check,
                        color: MyThemeData.primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: provider.locale == "ar"
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onSecondary),
                  ),
                ),
                provider.locale == "ar"
                    ? Icon(
                        Icons.check,
                        color: MyThemeData.primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
