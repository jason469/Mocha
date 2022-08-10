import 'package:flutter/material.dart';
import 'package:mocha/common/widgets/ListItem.dart';
import 'package:mocha/common/widgets/services/NoteItemServices.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/features/agenda/screens/edit_note_screen.dart';

class NoteItem extends StatefulWidget {
  final BuildContext context;
  final ListItem noteData;

  const NoteItem({
    Key? key,
    required this.context,
    required this.noteData,
  }) : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final NoteItemServices noteItemServices = NoteItemServices();
  late bool _loading;
  bool? _noteCompleted;
  late bool _noteSelected;
  late ListItem _note;

  Future<bool> swipeRight() async {
    var status = await noteItemServices.markAsCompleted(
      context: context,
      id: _note.buildId(context),
    );
    setState(() => _noteCompleted = status);
    return false;
  }

  bool swipeLeft() {
    noteItemServices.deleteNote(
      context: context,
      id: _note.buildId(context),
    );
    return true;
  }


  selectNote() {
    print('select');
    setState(() => _noteSelected = !_noteSelected);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Card(
        shape: _noteSelected
            ? const RoundedRectangleBorder(
                side: BorderSide(color: Colors.green),
              )
            : null,
        elevation: _noteSelected ? 5 : 2,
        child: GestureDetector(
          onTap: noteItemServices.editNote(context, widget),
          onDoubleTap: selectNote(),
          child: Dismissible(
            key: Key(
              _note.buildId(context),
            ),
            background: Container(
              color: Colors.green,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(Icons.check),
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Icon(Icons.delete),
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                return swipeRight();
              } else {
                return swipeLeft();
              }
            },
            child: _noteCompleted == false
                ? ListTile(
                    leading: Text(
                      _note.buildDate(context),
                    ),
                    title: Text(
                      _note.buildTitle(context),
                    ),
                    subtitle: Text(
                      _note.buildDescription(context),
                    ),
                    trailing: Text(
                      _note.buildUserName(context),
                    ),
                  )
                : ListTile(
                    leading: Text(
                      _note.buildDate(context),
                      style: GlobalVariables.completedNote,
                    ),
                    title: Text(
                      _note.buildTitle(context),
                      style: GlobalVariables.completedNote,
                    ),
                    subtitle: Text(
                      _note.buildDescription(context),
                      style: GlobalVariables.completedNote,
                    ),
                    trailing: Text(
                      _note.buildUserName(context),
                      style: GlobalVariables.completedNote,
                    ),
                  ),
          ),
        ),
      );
    }
  }
  @override
  void initState() {
    setState(() {
      _note = widget.noteData;
      _noteCompleted = widget.noteData.buildIsCompleted(context);
      _noteSelected = false;
      _loading = false;
    });
  }
}
