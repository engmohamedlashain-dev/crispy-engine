import 'package:flutter/material.dart';
import 'package:islamic/utilts/app_color.dart';
import 'package:islamic/utilts/app_text_style.dart';

class SuraContent extends StatelessWidget {
  String suracontent;

  int index;
  bool isselect = false;
  static const String routeName = "sura_contenet";

  SuraContent(
      {super.key,
      required this.suracontent,
      required this.index,
      required this.isselect});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: width * .02),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: height * .02,
          ),
          decoration: BoxDecoration(
              color: isselect ? AppColor.gold : AppColor.trnsparentColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColor.gold, width: 2)),
          child: Text(
            '$suracontent ',
            style: isselect ? AppTextStyle.black24 : AppTextStyle.gold24,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
