import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/data/models/benefit.dart';
import 'package:url_shortener/resources/colors.dart';

class CardBenefit extends StatelessWidget {
  final Benefit benefit;

  const CardBenefit(
    Key? key,
    this.benefit,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 14.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            margin: EdgeInsets.all(25.w),
            color: ColorsRes.backgroundWhite,
            child: Padding(
              padding: EdgeInsets.all(23.w),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50.h),
                      child: Text(
                        benefit.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: Text(
                        benefit.description,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 88.h,
            decoration: const BoxDecoration(
              color: ColorsRes.primaryDarkViolet,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              benefit.svgAssetPath,
              width: 40.w,
              height: 40.w,
              color: ColorsRes.primaryCyan,
            ),
          ),
        )
      ],
    );
  }
}
