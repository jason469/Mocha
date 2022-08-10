import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mocha/common/widgets/ListItem.dart';

import 'package:mocha/features/agenda/screens/add_note_screen.dart';
import 'package:mocha/features/agenda/services/agenda_service.dart';
import 'package:filter_list/filter_list.dart';

import '../../../common/widgets/NoteItem.dart';

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
  List<ListItem> _allNotes = [];
  List<ListItem> _selectedNotes = [];
  final bool _displaySearch = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agenda'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
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
                  ],
                ),
              ),
              _displaySearch
                  ? Flexible(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(_selectedNotes[index].buildTitle(context)),
                          );
                        },
                        itemCount: _selectedNotes.length,
                      ),
                    )
                  : Flexible(
                      flex: 7,
                      child: FutureBuilder(
                        future: agendaService.getNotes(context: context),
                        builder: (context, AsyncSnapshot snapshot) {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return NoteItem(
                                  context: context,
                                  noteData: snapshot.data[index]);
                            },
                          );
                        },
                      ),
                    ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddNoteScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.blue,
                      ),
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        openFilterDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        primary: Colors.blue,
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openFilterDialog() async {
    await FilterListDialog.display<ListItem>(
      context,
      listData: _allNotes,
      selectedListData: _selectedNotes,
      choiceChipLabel: (note) => note!.buildTitle(context),
      validateSelectedItem: (list, val) => list!.contains(val),
      onItemSearch: (note, query) {
        return note
            .buildTitle(context)
            .toLowerCase()
            .contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          _selectedNotes = List.from(list!);
        });
        Navigator.pop(context);
      },
    );
  }

  getNotes() async {
    List<ListItem> allNotes = await agendaService.getNotes(context: context);
    setState(() {
      _allNotes = allNotes;
    });
  }

  @override
  void initState() {
    super.initState();
    getNotes();
  }
}
