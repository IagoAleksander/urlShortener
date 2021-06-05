import 'package:flutter/material.dart';
import 'package:url_shortener/utils/router.dart';

class BenefitsScreen extends StatelessWidget {
  const BenefitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline4!,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(mainRoute);
        },
        child: Container(
          color: Colors.lightBlue,
          alignment: Alignment.center,
          child: const Text('Benefits Page'),
        ),
      ),
    );
  }
}
