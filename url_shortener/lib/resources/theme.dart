import 'package:flutter/material.dart';
import 'package:url_shortener/resources/colors.dart';

ThemeData getThemeData() {
  return ThemeData(
      backgroundColor: ColorsRes.backgroundWhite,
      primaryColor: ColorsRes.primaryCyan,
      primarySwatch: Colors.blue,
      fontFamily: 'Poppins');
}
