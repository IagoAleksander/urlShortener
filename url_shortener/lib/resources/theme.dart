import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_shortener/resources/colors.dart';

ThemeData getThemeData() {
  return ThemeData(
    backgroundColor: ColorsRes.backgroundWhite,
    scaffoldBackgroundColor: ColorsRes.backgroundOffWhite,
    primaryColor: ColorsRes.primaryCyan,
    primaryColorDark: ColorsRes.primaryDarkViolet,
    cardColor: ColorsRes.backgroundWhite,
    indicatorColor: ColorsRes.neutralGray,

    fontFamily: 'Poppins',
    textTheme: TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 35.sp,
        height: 1.3,
      ),
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
      ),
      bodyText1: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 17.sp,
        height: 1.3,
      ),
    ),
  );
}
