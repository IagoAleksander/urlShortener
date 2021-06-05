import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_shortener/resources/theme.dart';
import 'package:url_shortener/utils/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: getThemeData(),
        initialRoute: rootRoute,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
