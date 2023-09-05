import 'package:ecommerce_application/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  scaffoldBackgroundColor: AppColor.backgroundcolor,
  brightness: Brightness.dark,
  primarySwatch: AppColor.materialColorblue,
  appBarTheme: const AppBarTheme(
      iconTheme:  IconThemeData(
        color: AppColor.primaryblueColor,
      ),
      backgroundColor: AppColor.backgroundcolor,
      titleTextStyle: TextStyle(
        fontSize: 30,
        height: 1.2,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryblueColor,
      )),
  iconTheme: const IconThemeData(
    color: AppColor.primaryblueColor,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryblueColor,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true, //<-- SEE HERE
    fillColor: AppColor.black, //<-- SEE HERE
  ),
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: AppColor.primaryblueColor),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: AppColor.primaryblueColor),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
      displayMedium: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
      bodyLarge: TextStyle(
          height: 2,
          color: AppColor.grey,
          fontWeight: FontWeight.bold,
          fontSize: 14),
      bodyMedium: TextStyle(height: 2, color: AppColor.grey, fontSize: 14)),
  primarySwatch: AppColor.materialColorblue,
);
