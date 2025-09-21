import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_prefrance/shared_pref.dart';

class MostrecentProvider extends ChangeNotifier{

  List<int> mostRecent =[];

  void getMostREcentSouraList() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
//todo:['1,'2']=>[1,2]
    //todo:list of string list<string> convert to list<int> intiger==> map()
    List<String> mostRecentIndecesAsString =
        prefs.getStringList(ShearedprefKey.mostrecent) ?? [];

    mostRecent = mostRecentIndecesAsString.map((e)=>int.parse(e),).toList();
    notifyListeners();

  }
}

