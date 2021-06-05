import 'package:flutter/material.dart';
import 'package:url_shortener/ui/screens/benefits_screen.dart';

import '../ui/screens/main_screen.dart';
import '../ui/screens/start_screen.dart';

const String rootRoute = '/';
const String benefitsRoute = '/benefits';
const String mainRoute = '/main';

class RouteManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootRoute:
        return MaterialPageRoute(builder: (_) => const StartScreen());

      case benefitsRoute:
        return MaterialPageRoute(builder: (_) => const BenefitsScreen());

      case mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
