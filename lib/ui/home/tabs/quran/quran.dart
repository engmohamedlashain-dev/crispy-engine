import 'package:flutter/material.dart';
import 'package:islamic/shared_prefrance/shared_pref.dart';
import 'package:islamic/ui/home/tabs/quran/details_soura.dart';
import 'package:islamic/ui/home/tabs/quran/most_recent.dart';
import 'package:islamic/ui/home/tabs/quran/quran_resource.dart';
import 'package:islamic/ui/home/tabs/quran/soura_item.dart';
import 'package:islamic/utilts/app_assets.dart';
import 'package:islamic/utilts/app_color.dart';
import 'package:islamic/utilts/app_text_style.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .05,
        vertical: height * .005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Search Box
          TextField(
            onChanged: (newtext) {
              searchByNewText(newtext);
            },
            style: AppTextStyle.whitebold20,
            cursorColor: AppColor.white,
            decoration: InputDecoration(
              hintText: 'Soura Quran',
              hintStyle: const TextStyle(color: AppColor.white),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .03,
                  vertical: height * .01,
                ),
                child: Image.asset(AppAssest.prifxIcon),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.gold,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: AppColor.gold,
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: height * .01),

          /// Most Recently

          MostRecent(),

          /// Suras List
          Text(
            "Suras List ",
            style: TextStyle(color: AppColor.white),
          ),
          SizedBox(height: height * .01),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // todo:save last sura index in share prefranc
                    saveNewSouraList(filterList[index]);
                    Navigator.of(context).pushNamed(
                      DetailsSoura.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SouraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 2,
                  endIndent: width * 0.05,
                  indent: width * 0.05,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String newtext) {
    if (newtext.isEmpty) {
      filterList = List.generate(114, (index) => index);
    } else {
      final query = newtext.toLowerCase();

      filterList = List.generate(114, (index) => index)
          .where((i) =>
              QuranResource.quranSurahs[i].toLowerCase().contains(query) ||
              QuranResource.quranSurahsEnglish[i].toLowerCase().contains(query))
          .toList();
    }

    setState(() {});
  }
}
