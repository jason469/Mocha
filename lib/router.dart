import 'package:flutter/material.dart';
import 'package:mocha/features/auth/screens/auth_screen.dart';
import 'package:mocha/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Screen doesnt exist'))),
      );
  }
}
