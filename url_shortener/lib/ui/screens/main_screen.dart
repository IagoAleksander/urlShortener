import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline4!,
      child: Container(
        color: Colors.pinkAccent,
        alignment: Alignment.center,
        child: const Text('Main Page'),
      ),
    );
  }
}
