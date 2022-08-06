import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/providers/user_provider.dart';
import 'package:mocha/features/agenda/screens/add_note_screen.dart';

class AgendaScreen extends StatefulWidget {
  static const String routeName = '/agenda';
  static final String _currentDateTime =
      DateFormat('EEE d MMM, yyyy').format(DateTime.now());

  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Agenda",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AgendaScreen._currentDateTime,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AddNoteScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.blue,
                      ),
                      child: const Icon(Icons.add),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
