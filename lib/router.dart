import 'package:flutter/material.dart';
import 'package:mocha/common/widgets/BottomBar.dart';
import 'package:mocha/features/agenda/screens/agenda_screen.dart';
import 'package:mocha/features/auth/screens/auth_screen.dart';
import 'package:mocha/features/calendar/screens/calendar_screen.dart';
import 'package:mocha/features/profile/screens/profile_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );

    case CalendarScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CalendarScreen(),
      );

    case AgendaScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AgendaScreen(),
      );

    case ProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProfileScreen(),
      );

    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BottomBar(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>
            const Scaffold(body: Center(child: Text('Screen doesnt exist'))),
      );
  }
}
