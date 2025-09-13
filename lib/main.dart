import 'package:flutter/material.dart';
import 'package:islamic/ui/home/home_page.dart';
import 'package:islamic/utilts/app_theme.dart';

void main() {
  runApp( MyApp());
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
      },
    darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}




