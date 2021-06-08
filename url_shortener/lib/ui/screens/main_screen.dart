import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_shortener/data/models/shortened_url.dart';
import 'package:url_shortener/mobx/form_store.dart';
import 'package:url_shortener/mobx/url_shortener_store.dart';
import 'package:url_shortener/resources/constants.dart';
import 'package:url_shortener/ui/widgets/custom_button.dart';
import 'package:url_shortener/ui/widgets/item_history_link.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final formStore = FormStore();
  final urlShortenerStore = UrlShortenerStore();

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
            Expanded(
              child: Observer(
                builder: (_) {
                  switch (urlShortenerStore.state) {
                    case EnumState.loadingHistory:
                    case EnumState.shorteningUrl:
                      return _displayProgressIndicator();
                    case EnumState.emptyState:
                      return _displayEmptyState();
                    case EnumState.contentList:
                      return _displayContentList();
                  }
                },
              ),
            ),
            _displayBottomButtons(),
          ],
        ),
      ),
    );
  }

  _displayProgressIndicator() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 16.h),
          Text(
            urlShortenerStore.state == EnumState.loadingHistory
                ? Texts.mainScreenLoadingUrlsProgressIndicatorText
                : Texts.mainScreenShorteningUrlProgressIndicatorText,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  _displayEmptyState() {
    return Column(
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
                  ImagePaths.illustrationImagePath,
                );
              }
            },
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          Texts.mainScreenEmptyStateHeaderText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 7.h),
        Text(Texts.mainScreenEmptyStateDescriptionText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1),
        SizedBox(height: 48.h),
      ],
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

  _displayContentList() {
    return ListView.builder(
      itemCount: urlShortenerStore.urlsList.length + 1,
      itemBuilder: (_, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
            child: Text(
              Texts.mainScreenContentListHeaderText,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          );
        }
        var model = urlShortenerStore.urlsList.reversed.toList()[index - 1];
        return CardLink(
          UniqueKey(),
          model,
          () => urlShortenerStore.copyUrlToClipboard(model),
          () => _showDialog(model),
        );
      },
    );
  }

  _displayBottomButtons() {
    return Container(
      color: Theme.of(context).primaryColorDark,
      height: 204.h,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(ImagePaths.shapeImagePath),
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
                            Texts.mainScreenFormHintText,
                        hintStyle: !formStore.hasErrors
                            ? Theme.of(context).textTheme.caption
                            : Theme.of(context).textTheme.caption?.merge(
                                  TextStyle(
                                      color: Theme.of(context).errorColor),
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
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomButton(
                  UniqueKey(),
                  ButtonType.elevatedButton,
                  Texts.mainScreenShortenUrlButtonText,
                  () {
                    formStore.validateLink(_linkFieldController);
                    if (!formStore.hasErrors) {
                      urlShortenerStore.shortUrl(_linkFieldController);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showDialog(ShortenedUrl model) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Text(
          Texts.mainScreenDeleteConfirmationDialogText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(Texts.mainScreenDeleteConfirmationDialogCancelOptionText),
          ),
          TextButton(
            onPressed: () {
              urlShortenerStore.removeUrlFromHistory(model);
              Navigator.pop(context);
            },
            child: const Text(Texts.mainScreenDeleteConfirmationDialogConfirmOptionText),
          ),
        ],
      ),
    );
  }
}
