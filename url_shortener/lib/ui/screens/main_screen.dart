import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/mobx/form_store.dart';
import 'package:url_shortener/ui/widgets/custom_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final formStore = FormStore();

  final TextEditingController _linkFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _displayEmptyState(),
            Container(
              color: Theme.of(context).primaryColorDark,
              height: 204.h,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset('assets/images/shape.svg'),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 46.h,
                          left: 48.w,
                          right: 48.w,
                        ),
                        child: SizedBox(
                          height: 49.h,
                          child: Observer(
                            builder: (_) => TextFormField(
                              onChanged: (value) => formStore.setLink(value),
                              controller: _linkFieldController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.all(0),
                                fillColor: Theme.of(context).backgroundColor,
                                filled: true,
                                hintText: formStore.linkErrorMessage ??
                                    "Shorten a link here ...",
                                hintStyle: !formStore.hasErrors
                                    ? Theme.of(context).textTheme.caption
                                    : Theme.of(context)
                                        .textTheme
                                        .caption
                                        ?.merge(
                                          TextStyle(
                                              color:
                                                  Theme.of(context).errorColor),
                                        ),
                                errorText: formStore.linkErrorMessage,
                                errorBorder: formStore.hasErrors
                                    ? OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Theme.of(context).errorColor,
                                            width: 2))
                                    : null,
                                errorStyle: const TextStyle(
                                    height: 0, color: Colors.transparent),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 48.w,
                          right: 48.w,
                        ),
                        child: CustomButton(
                          UniqueKey(),
                          ButtonType.elevatedButton,
                          "Shorten it!",
                          () => formStore.validateLink(_linkFieldController),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _displayEmptyState() {
    return Expanded(
      child: Column(
        children: [
          _displayLogo(),
          SizedBox(height: 14.h),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                if (constraint.maxHeight < 200.h) {
                  return Container();
                } else {
                  return SvgPicture.asset(
                    'assets/images/illustration.svg',
                  );
                }
              },
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "Let’s get started!",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 7.h),
          Text("Paste your first link into\nthe field to shorten it",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 48.h),
        ],
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
