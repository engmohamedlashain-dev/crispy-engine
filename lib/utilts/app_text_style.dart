import 'package:flutter/material.dart';
import "app_color.dart";

abstract final class AppTextStyle {
  static const whitebold20 = TextStyle(
      fontSize: 20, color: AppColor.white, fontWeight: FontWeight.bold);
  static const whitebold14 =
      TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold);
  static const whitebold12 =
      TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold);
  static const whitebold6 =
      TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);

  static const black24 = TextStyle(
      fontSize: 24, color: AppColor.black, fontWeight: FontWeight.bold);
  static const black14 = TextStyle(
      fontSize: 14, color: AppColor.black, fontWeight: FontWeight.bold);
  static const black16 = TextStyle(
      fontSize: 16, color: AppColor.black, fontWeight: FontWeight.bold);

  static const gold20 = TextStyle(
      fontSize: 20, color: AppColor.gold, fontWeight: FontWeight.bold);
  static const gold24 = TextStyle(
      fontSize: 24, color: AppColor.gold, fontWeight: FontWeight.bold);
}
