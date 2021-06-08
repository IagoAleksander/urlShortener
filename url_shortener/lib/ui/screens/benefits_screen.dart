import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:url_shortener/data/models/benefit.dart';
import 'package:url_shortener/resources/constants.dart';
import 'package:url_shortener/ui/widgets/custom_button.dart';
import 'package:url_shortener/ui/widgets/item_benefit.dart';
import 'package:url_shortener/utils/router.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  _BenefitsScreenState createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final _currentPageNotifier = ValueNotifier<int>(0);
  final List<Benefit> benefits = [
    Benefit(
        "Brand Recognition",
        "Boost your brand recognition with each click. Generic links don’t mean a thing. Branded links help instil confidence in your content.",
        IconPaths.diagramIconPath),
    Benefit(
        "Detailed Records",
        "Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.",
        IconPaths.gaugeIconPath),
    Benefit(
        "Fully Customizable",
        "lmprove brand awareness and content discoverability through customizable links, supercharglng audience engagement.",
        IconPaths.toolsIconPath)
  ];

  @override
  void dispose() {
    _controller.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _displayLogo(),
            const Spacer(),
            _buildPageView(),
            _buildDotsIndicator(),
            const Spacer(),
            CustomButton(
              UniqueKey(),
              ButtonType.textButton,
              Texts.benefitsScreenSkipButtonText,
              () => Navigator.of(context).pushNamed(mainRoute),
            )
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

  _buildPageView() {
    return SizedBox(
      height: 344.h,
      child: PageView(
        controller: _controller,
        children: benefits
            .map<Widget>((benefit) => CardBenefit(UniqueKey(), benefit))
            .toList(),
        onPageChanged: (int index) {
          _currentPageNotifier.value = index;
        },
      ),
    );
  }

  _buildDotsIndicator() {
    return CirclePageIndicator(
      size: 10.w,
      selectedSize: 10.w,
      borderWidth: 4.r,
      selectedDotColor: Theme.of(context).indicatorColor,
      borderColor: Theme.of(context).indicatorColor,
      dotColor: Theme.of(context).scaffoldBackgroundColor,
      itemCount: benefits.length,
      currentPageNotifier: _currentPageNotifier,
    );
  }
}
