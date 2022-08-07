import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/common/widgets/ListItem.dart';
import 'package:mocha/providers/user_provider.dart';
import 'package:mocha/features/agenda/screens/add_note_screen.dart';
import 'package:mocha/features/agenda/services/agenda_service.dart';

class AgendaScreen extends StatefulWidget {
  static const String routeName = '/agenda';
  static final String _currentDateTime =
      DateFormat('EEE d MMM, yyyy').format(DateTime.now());

  const AgendaScreen({Key? key}) : super(key: key);

  @override
  State<AgendaScreen> createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  final AgendaService agendaService = AgendaService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const AddNoteScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: Colors.blue,
                              ),
                              child: const Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: agendaService.getNotes(context: context),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data[index];
                      return ListTile(
                        title: item.buildTitle(context),
                        subtitle: item.buildDescription(context),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
