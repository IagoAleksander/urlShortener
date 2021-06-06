import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_shortener/resources/colors.dart';

enum ButtonType {
  elevatedButton,
  textButton,
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final VoidCallback? _function;

  const CustomButton(
    Key? key,
    this.buttonType,
    this.text,
    this._function,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.elevatedButton:
        {
          return Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(30)),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor)),
              onPressed: _function,
              child: Container(
                child: Text(
                  text.toUpperCase(),
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
          );
        }

      case ButtonType.textButton:
        {
          return Padding(
            padding: EdgeInsets.only(bottom: 30.h, left: 48.w, right: 48.w),
            child: TextButton(
              onPressed: _function,
              child: Container(
                child: Text(
                  text,
                  style: TextStyle(
                    color: ColorsRes.neutralGrayishViolet,
                    fontSize: ScreenUtil().setSp(17),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                alignment: Alignment.center,
                width: ScreenUtil().setWidth(280),
                height: ScreenUtil().setHeight(23),
              ),
            ),
          );
        }

      default:
        {
          return ElevatedButton(onPressed: _function, child: Text(text));
        }
    }
  }
}
