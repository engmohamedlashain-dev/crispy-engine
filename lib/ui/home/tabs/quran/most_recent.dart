import 'package:flutter/cupertino.dart';
import 'package:islamic/shared_prefrance/shared_pref.dart';
import 'package:islamic/ui/home/tabs/quran/quran_resource.dart';
import 'package:provider/provider.dart';

import '../../../../provider/mostrecent_provider.dart';
import '../../../../utilts/app_assets.dart';
import '../../../../utilts/app_color.dart';
import '../../../../utilts/app_text_style.dart';

class MostRecent extends StatefulWidget {

   MostRecent({super.key});

  @override
  State<MostRecent> createState() => _MostRecentState();

}

class _MostRecentState extends State<MostRecent> {
late MostrecentProvider mostrecentProvider;
@override


  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    mostrecentProvider.getMostREcentSouraList();} ,);}


 // void readMostRecentSuraList()  async {
 //    mostRecent= await getMostREcentSouraList();
 //    setState(() {
 //
 //    });
 //  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostrecentProvider = Provider.of<MostrecentProvider>(context);
    return mostrecentProvider. mostRecent.isEmpty?SizedBox():
      Column

        (
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Text(
            "Most Recently ",
            style: TextStyle(color: AppColor.white),
          ),
          SizedBox(height: height * .01),
          SizedBox(
            width: double.infinity,
            height: height * 0.18,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .04,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.gold,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(QuranResource.quranSurahsEnglish[mostrecentProvider. mostRecent[index]], style: AppTextStyle.black24),
                          Text(QuranResource.quranSurahs[mostrecentProvider. mostRecent[index]], style: AppTextStyle.black24),
                          Text("${QuranResource.quranSurahVerses[mostrecentProvider. mostRecent[index]]} Verses", style: AppTextStyle.black14),
                        ],
                      ),
                      Image.asset(AppAssest.imgmostrecent),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * .02),
              itemCount: mostrecentProvider. mostRecent.length,
            ),
          ),
          SizedBox(height: height * .01),

        ],
      )

      ;
  }
}
