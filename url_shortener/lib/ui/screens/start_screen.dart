import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/utils/router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(50),
              ),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setHeight(32),
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/illustration.svg',
              ),
            ),
            Text(
              "More than just\nshorter links",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(35),
                  fontWeight: FontWeight.bold,
                  height: 1.3),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              child: Text(
                "Build your brand’s recognition and\nget detailed insights on how your\nlinks are performing. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(17),
                    fontWeight: FontWeight.w500,
                    height: 1.3),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                left: ScreenUtil().setWidth(48),
                right: ScreenUtil().setWidth(48),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(benefitsRoute);
                  },
                  child: Container(
                    child: Text(
                      "Start".toUpperCase(),
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: ScreenUtil().setWidth(280),
                    height: ScreenUtil().setHeight(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
