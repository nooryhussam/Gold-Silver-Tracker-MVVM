import 'package:flutter/material.dart';
import 'package:silver/core/presentation/home_screen.dart';
import 'package:silver/core/routing/routes.dart';
import 'package:silver/features/gold/representaton/screens/gold_screen.dart';
import 'package:silver/features/silver/representation/screens/silver_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );
      case AppRoutes.goldScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const GoldScreen();
          },
        );  case AppRoutes.silverScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const SilverScreen();
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('No route defined')),
            );
          },
        );
    }
  }
}
