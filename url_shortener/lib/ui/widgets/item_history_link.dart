import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/data/models/shortened_url.dart';
import 'package:url_shortener/resources/colors.dart';
import 'package:url_shortener/resources/constants.dart';
import 'package:url_shortener/ui/widgets/custom_button.dart';

class CardLink extends StatelessWidget {
  final ShortenedUrl shortenedUrl;
  final VoidCallback? _clickFunction;
  final VoidCallback? _removeFunction;

  const CardLink(
    Key? key,
    this.shortenedUrl,
    this._clickFunction,
    this._removeFunction,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 25.w),
      color: ColorsRes.backgroundWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 23.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      shortenedUrl.originalLink,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  InkWell(
                    onTap: _removeFunction,
                    child: SvgPicture.asset(
                      IconPaths.deleteIconPath,
                      height: 18.h,
                      color: ColorsRes.neutralGrayishViolet,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 25,
              thickness: 1,
              color: Theme.of(context).dividerColor,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  shortenedUrl.shortLink,
                  style: Theme.of(context).textTheme.bodyText1?.merge(
                        TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 23.h,
              ),
              child: CustomButton(
                UniqueKey(),
                ButtonType.elevatedButton,
                shortenedUrl.isSelected
                    ? Texts.historyItemWidgetCopiedButtonText
                    : Texts.historyItemWidgetCopyButtonText,
                _clickFunction,
                isAlternativeVersion: shortenedUrl.isSelected,
              ),
            )
          ],
        ),
      ),
    );
  }
}
