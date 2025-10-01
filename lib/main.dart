import 'package:flutter/material.dart';
import 'package:islamic/provider/mostrecent_provider.dart';
import 'package:islamic/ui/home/home_page.dart';
import 'package:islamic/ui/home/tabs/quran/details_soura.dart';
import 'package:islamic/ui/home/tabs/quran/sura_content.dart';
import 'package:islamic/utilts/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

ChangeNotifierProvider(
    create: (context) => MostrecentProvider(),


 child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     initialRoute: HomePage.routeName,
      routes: {
       HomePage.routeName:(context)=>HomePage(),
        DetailsSoura.routeName:(context)=>DetailsSoura(),

      },
    darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}




