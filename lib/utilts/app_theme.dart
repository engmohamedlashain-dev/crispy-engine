import 'package:flutter/material.dart';
import 'package:islamic/utilts/app_color.dart';
import 'package:islamic/utilts/app_text_style.dart';

class AppTheme{
static final ThemeData darkTheme=
ThemeData(

  //tod:const=> compile time full immutable
  //tod:const=> compile run time half imutable
  scaffoldBackgroundColor:AppColor.trnsparentColor,

bottomNavigationBarTheme: BottomNavigationBarThemeData(    
  selectedItemColor: AppColor.white,
  unselectedItemColor: AppColor.black,),
textTheme:TextTheme(
  bodyMedium: TextStyle(

  ),
),
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: AppColor.gold,
 fontSize: 25,
      fontWeight: FontWeight.bold
    ),
   centerTitle: true,
    color: AppColor.black,
    iconTheme: IconThemeData(
      color: AppColor.gold
    )
  )

);
}