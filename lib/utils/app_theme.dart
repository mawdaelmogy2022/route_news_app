import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_style.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.whiteColor,
      focusColor: AppColor.blackColor,
      canvasColor: AppColor.whiteColor,
      appBarTheme: const AppBarTheme(
          color: AppColor.whiteColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.blackColor)),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColor.whiteColor),
      textTheme: TextTheme(
        labelLarge: AppStyle.black20meduim,
        labelMedium: AppStyle.black16bold,
        labelSmall: AppStyle.black14meduim,
        titleLarge: AppStyle.black24meduim,
        titleSmall: AppStyle.white14meduim,
      ));
  static final ThemeData darktheme = ThemeData(
      scaffoldBackgroundColor: AppColor.blackColor,
      focusColor: AppColor.whiteColor,
      canvasColor: AppColor.blackColor,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColor.blackColor,
          iconTheme: IconThemeData(color: AppColor.whiteColor)),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColor.whiteColor),
      textTheme: TextTheme(
        labelLarge: AppStyle.white20meduim,
        labelMedium: AppStyle.white16bold,
        labelSmall: AppStyle.white14meduim,
        titleLarge: AppStyle.white24meduim,
        titleSmall: AppStyle.black14meduim,
      ));
}
