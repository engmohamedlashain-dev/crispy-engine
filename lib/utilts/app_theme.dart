import 'package:flutter/material.dart';
import 'package:islamic/utilts/app_color.dart';

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
)

);
}