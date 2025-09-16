import 'package:flutter/material.dart';
import 'package:islamic/ui/home/tabs/quran/quran_resource.dart';
import 'package:islamic/utilts/app_assets.dart';

import '../../../../utilts/app_text_style.dart';

class SouraItem extends StatelessWidget {
  int index;
   SouraItem({super.key , required this.index});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return
      Row(

        children: [
         Stack(
           alignment: Alignment.center,

           children: [

         Image.asset(AppAssest.souraFrame,
           width: 40,
           height: 40),

         Text("${index+1}",style: TextStyle(
           color: Colors.white

         ),),
       ],
         ),
          SizedBox(width: width*.02,),
          Column(
            children: [


                Text(QuranResource.quranSurahsEnglish[index],
                    style: AppTextStyle.whitebold20),
                 Text('Verses ${QuranResource.quranSurahVerses[index]}',style: AppTextStyle.whitebold14),


            ],
          ),
          Spacer(),
          Text(QuranResource.quranSurahs[index],style: AppTextStyle.whitebold20)
        ],
      );


  }
}
