import 'package:flutter/material.dart';
import 'package:url_shortener/utils/router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline4!,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(benefitsRoute);
        },
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text('Start Page'),
        ),
      ),
    );
  }
}
