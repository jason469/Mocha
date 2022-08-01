import 'package:flutter/material.dart';
import 'package:mocha/providers/user_provider.dart';
import 'package:provider/provider.dart';

class AgendaScreen extends StatefulWidget {
  static const String routeName = '/agenda';
  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Text(
          "Agenda",
        ),
      ),
    );
  }
}
