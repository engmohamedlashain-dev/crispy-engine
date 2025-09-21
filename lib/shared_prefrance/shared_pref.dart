import 'package:shared_preferences/shared_preferences.dart';

//todo: save last soura =>write data
class ShearedprefKey {
  static const String mostrecent = 'most_recent';
}

Future<void> saveNewSouraList(int newSourIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

   List<String> mostRecentIndeces =
      prefs.getStringList(ShearedprefKey.mostrecent) ?? [];

  //todo:add  sura index in list in shared prefrance

  if(mostRecentIndeces.contains('$newSourIndex')){
    mostRecentIndeces.remove('$newSourIndex');
    mostRecentIndeces.insert(0,'$newSourIndex');
  }else{

    mostRecentIndeces.insert(0,'$newSourIndex');
  }
  if(mostRecentIndeces.length>5){
    // mostRecentIndeces.removeLast();
    mostRecentIndeces= mostRecentIndeces.sublist(0,5);
  }

  await prefs.setStringList(ShearedprefKey.mostrecent, mostRecentIndeces);
}
//todo:get suraFuture<List<int>>ead data
Future<List<int>> getMostREcentSouraList() async {

  final SharedPreferences prefs = await SharedPreferences.getInstance();
//todo:['1,'2']=>[1,2]
  //todo:list of string list<string> convert to list<int> intiger==> map()
   List<String> mostRecentIndecesAsString =
      prefs.getStringList(ShearedprefKey.mostrecent) ?? [];

 List<int> mostRecentIndecesASInteger = mostRecentIndecesAsString.map((e)=>int.parse(e),).toList();
 return mostRecentIndecesASInteger;
}
