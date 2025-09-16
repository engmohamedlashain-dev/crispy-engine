import 'package:flutter/material.dart';
import 'package:islamic/ui/home/tabs/quran/details_soura.dart';
import 'package:islamic/ui/home/tabs/quran/soura_item.dart';
import 'package:islamic/utilts/app_assets.dart';
import 'package:islamic/utilts/app_color.dart';
import 'package:islamic/utilts/app_text_style.dart';

class Quran extends StatelessWidget {

   Quran({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return  Padding(
      padding:  EdgeInsets.symmetric(

        horizontal: width*.05,
        vertical: height*.005
      ),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Soura Quran',
             hintStyle: TextStyle(color: AppColor.white,),
            prefixIcon:
            Padding(padding: EdgeInsets.symmetric(
                horizontal: width*.03,
                vertical: height*.01
            ),

                child:
            Image.asset(AppAssest.prifxIcon)
      ),
             enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
               borderSide:BorderSide(
                 color: AppColor.gold,
                 width: 1,


               )
             ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:BorderSide(
                    color: AppColor.gold,
                    width: 1,


                  )
              ),

            ),


          ),
          SizedBox(height: height*.01,),
          Text("Most Recently "
          ,style: TextStyle(
                color: AppColor.white
              ),
          ),
          SizedBox(height: height*.01),

          SizedBox(
            width: double.infinity,
            height: height*0.18,


            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                      Container(
                        padding:EdgeInsets.symmetric(
                          horizontal: width*.04,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.gold
                              ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(

                          children: [

                            Column(


                               mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("Al-Anbiya",
                                  style: AppTextStyle.black24,

                                ),
                                Text("الأنبياء",
                                  style: AppTextStyle.black24,),
                                Text("112 Verses  ",
                                  style: AppTextStyle.black14,),
                              ],

                            ),
                            Image.asset(AppAssest.imgmostrecent),
                          ],
                        ),
                      );
                }

                ,
                separatorBuilder: (context, index) =>
               SizedBox(width: width*.02,),
                itemCount: 10),
          ),
          SizedBox(height: height*.01,),
          Text("Suras List "
            ,style: TextStyle(
                color: AppColor.white
            ),
          ),
          SizedBox(height: height*.01),


          Expanded(child: Container(

            child: ListView.separated(
          padding: EdgeInsets.zero,

                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(DetailsSoura.routeName,arguments: index);
                      },

                      child: SouraItem(index: index));
                },
                separatorBuilder: (context, index) {
            return Divider(
              thickness: 2,
              endIndent: width*0.05,
              indent:  width*0.05,

            );
                },
                itemCount: 114),
          ))












        ],
      ),
    );
  }
}
