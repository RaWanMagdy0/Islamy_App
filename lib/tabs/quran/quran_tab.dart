import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs/quran/quran_view.dart';

import '../../my_theme_data.dart';
import 'sura_details.dart';

class QuranTab extends StatelessWidget {
  List<String> SuraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/quran_image.png"),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
          height: 6,
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              AppLocalizations.of(context)!.suraNumber,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )),
            Container(
              width: 1.5,
              color: MyThemeData.primary,
              height: 40,
            ),
            Expanded(
                child: Text(
              AppLocalizations.of(context)!.suraName,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            )),
          ],
        ),
        Divider(
          thickness: 2,
          color: MyThemeData.primary,
          height: 6,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 2,
              color: Colors.transparent,
              endIndent: 40,
              indent: 40,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                      arguments: SuraModel(
                          suraname: SuraNames[index],
                          suranumber: "${index + 1}"));
                },
                child: QuranView(
                  suraName: SuraNames[index],
                  suraNumber: "${index + 1}",
                ),
              );
            },
            itemCount: SuraNames.length,
          ),
        ),
      ],
    );
  }
}

class SuraModel {
  final String suraname;
  final String suranumber;

  SuraModel({required this.suraname, required this.suranumber});
}
