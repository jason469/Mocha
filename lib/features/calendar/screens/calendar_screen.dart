import 'package:flutter/material.dart';
import 'package:mocha/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CalendarScreen extends StatefulWidget {
  static const String routeName = '/calendar';
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreen();
}

class _CalendarScreen extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Text(
          "Calendar",
        ),
      ),
    );
  }
}
