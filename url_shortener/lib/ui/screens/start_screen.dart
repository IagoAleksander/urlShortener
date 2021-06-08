import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/resources/constants.dart';
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
                ImagePaths.illustrationImagePath,
              ),
            ),
            Text(Texts.startScreenHeaderText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10.h),
            Text(
                Texts.startScreenDescriptionText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 25.w),
              child: CustomButton(
                UniqueKey(),
                ButtonType.elevatedButton,
                Texts.startScreenStartButtonText,
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
        ImagePaths.logoImagePath,
        width: 120.w,
        height: 32.h,
      ),
    );
  }
}
