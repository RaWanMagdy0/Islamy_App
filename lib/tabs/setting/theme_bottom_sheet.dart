import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../my_theme_data.dart';
import '../../providers/my_provider.dart';

class themeBottomSheet extends StatelessWidget {
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
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: provider.theme == ThemeMode.light
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onPrimary),
                ),
                provider.theme == ThemeMode.light
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
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                provider.theme == ThemeMode.dark
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
