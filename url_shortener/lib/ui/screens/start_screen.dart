import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/ui/widgets/custom_button.dart';
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
            _displayLogo(),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/illustration.svg',
              ),
            ),
            Text("More than just\nshorter links",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10.h),
            Text(
                "Build your brand’s recognition and\nget detailed insights on how your\nlinks are performing. ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.h,
                horizontal: 48.w,
              ),
              child: CustomButton(
                UniqueKey(),
                ButtonType.elevatedButton,
                "Start",
                () => Navigator.of(context).pushNamed(benefitsRoute),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _displayLogo() {
    return Padding(
      padding: EdgeInsets.only(
        top: 50.h,
      ),
      child: SvgPicture.asset(
        'assets/images/logo.svg',
        width: 120.w,
        height: 32.h,
      ),
    );
  }
}
