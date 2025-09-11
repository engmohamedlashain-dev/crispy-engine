import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:islamic/ui/home/tabs/ahadeth/ahadeth.dart';
import 'package:islamic/ui/home/tabs/azkar/azakar.dart';
import 'package:islamic/ui/home/tabs/quran/quran.dart';
import 'package:islamic/ui/home/tabs/radio/radio.dart';
import 'package:islamic/ui/home/tabs/sebha/sebha.dart';
import 'package:islamic/utilts/app_assets.dart';
import 'package:islamic/utilts/app_color.dart';

class HomePage extends StatefulWidget {
  static const String  routeName='home_screen';
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   int selectedindex=0;
List<String> backgroundImges=[
 AppAssest.soraBackground,
  AppAssest.ahadethBg,
  AppAssest.sebhaBackground,
  AppAssest.radioBackground,
  AppAssest.timeBackground,
];
List<Widget>tabs=[
  Quran(),
  Ahadeth(),
  Sebha(),
  RadioTabs(),
  Azakar(),

];
  @override
  Widget build(BuildContext context) {

    return

      Stack(
        children: [

          Image.asset(
            // getimagebackgroond(),
          backgroundImges[selectedindex],

          width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Scaffold(
body: Column(
  crossAxisAlignment:CrossAxisAlignment.stretch,
  children: [
    Image.asset(AppAssest.logo),
    Expanded(child: tabs[selectedindex])
  ],
),
            bottomNavigationBar: Theme(

              data: Theme.of(context).copyWith(
                canvasColor: AppColor.gold,
              ),
              child:  BottomNavigationBar(
                  currentIndex: selectedindex,
// showUnselectedLabels: true,
onTap: (index){
  selectedindex=index;
setState(() {

});

},


                // backgroundColor: AppColor.gold,
                //   type: BottomNavigationBarType.fixed
                //    ,

                  items : [
                    BottomNavigationBarItem(icon: builtBottomNavigationBar(index: 0, imagpathh: AppAssest.icIslamic)
                        ,label: 'Quran'),

                    BottomNavigationBarItem(icon: builtBottomNavigationBar(index: 1, imagpathh: AppAssest.icBook)
                        ,label: 'Hadeth'),

                    BottomNavigationBarItem(icon: builtBottomNavigationBar(index: 2, imagpathh: AppAssest.icNecklace)
                        ,label: 'Sebha'),

                    BottomNavigationBarItem(icon: builtBottomNavigationBar(index: 3, imagpathh: AppAssest.icRadio)
                        ,label: 'Radio'),
                    BottomNavigationBarItem(icon: builtBottomNavigationBar(index: 4, imagpathh: AppAssest.icVector)
                        ,label: 'Time'),

                  ]),
            ),
          )
        ],

      );

  }

  Widget builtBottomNavigationBar({required int index,required String imagpathh}){
    return
selectedindex==index?
       Container(
        padding:EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(66), color:AppColor.blackwithopicty60),

        child: ImageIcon(AssetImage(imagpathh))):

ImageIcon(AssetImage(imagpathh));
  }

//   String getimagebackgroond(){
// switch(selectedindex){
//   case 0:
//   return  AppAssest.soraBackground;
//   case 1:
//   return  AppAssest.soraBackground;
//   case 1:
//   return  AppAssest.soraBackground;
//   case 2:
//   return  AppAssest.soraBackground;
//   case 3:
//   return  AppAssest.soraBackground;
//   case 4:
//   return  AppAssest.soraBackground;
//   default:
//   return  AppAssest.soraBackground;
//
// }
//
//   }
}
