import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/provider/mostrecent_provider.dart';
import 'package:islamic/shared_prefrance/shared_pref.dart';
import 'package:islamic/ui/home/tabs/quran/most_recent.dart';
import 'package:islamic/ui/home/tabs/quran/quran_resource.dart';
import 'package:islamic/ui/home/tabs/quran/sura_content.dart';
import 'package:islamic/utilts/app_assets.dart';
import 'package:islamic/utilts/app_color.dart';
import 'package:islamic/utilts/app_text_style.dart';
import 'package:provider/provider.dart';

class DetailsSoura extends StatefulWidget {
  int selectedIndex = -1;
  static const String routeName = 'details_soura';

  DetailsSoura({super.key});

  @override
  State<DetailsSoura> createState() => _DetailsSouraState();
}

class _DetailsSouraState extends State<DetailsSoura> {
  int selectIndex = -1;
  List<String> versess = [];
  late MostrecentProvider mostrecentProvider;
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   mostrecentProvider. getMostREcentSouraList();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    mostrecentProvider=Provider.of<MostrecentProvider>(context);
    if (versess.isEmpty) {
      loadsourceFile(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(QuranResource.quranSurahsEnglish[index]),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppAssest.leftcorner,
              ),
              Text(QuranResource.quranSurahs[index],
                  style: AppTextStyle.gold20),
              Image.asset(
                AppAssest.rightcorner,
              ),
            ],
          ),
          Expanded(
            child: versess.isEmpty
                ? Center(child: CircularProgressIndicator(

              color: AppColor.gold,
            ))
                : ListView.separated(
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectIndex = index;
                          });
                        },
                        child: SuraContent(
                            suracontent: versess[index],
                            index: index,
                            isselect: selectIndex == index)),
                    separatorBuilder: (context, index) {
                      return SizedBox();
                    },
                    itemCount: versess.length,
                  ),
          ),
          Image.asset(AppAssest.bottomcorner)
        ],
      ),
    );
  }

  void loadsourceFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = fileContent.split('\n');
    print('index:${index}');
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
      versess = lines;
      Future.delayed(
        Duration(seconds: 1),
        () => setState(() {}),
      );
    }
  }
}
