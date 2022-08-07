import 'package:flutter/material.dart';
import 'package:mocha/common/widgets/services/NoteItemServices.dart';
import 'package:mocha/constants/global_variables.dart';
import 'package:mocha/models/note.dart';

class NoteItem extends StatefulWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;

  NoteItem({Key? key, required this.context, required this.snapshot})
      : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final NoteItemServices noteItemServices = NoteItemServices();

  @override
  Widget build(BuildContext context) {
    if (!widget.snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: widget.snapshot.data.length,
        itemBuilder: (context, index) {
          final note = widget.snapshot.data[index];
          return Card(
            child: Dismissible(
              key: Key(
                note.buildId(context),
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
                  noteItemServices.markAsCompleted(
                    context: context,
                    id: note.buildId(context),
                  );
                  setState(() {

                  });
                  return false;
                } else {
                  noteItemServices.deleteNote(
                      context: context, id: note.buildId(context));
                  return true;
                }
              },
              child: note.buildIsCompleted(context) == false
                  ? ListTile(
                      leading: Text(
                        note.buildDate(context),
                      ),
                      title: Text(
                        note.buildTitle(context),
                      ),
                      subtitle: Text(
                        note.buildDescription(context),
                      ),
                      trailing: Text(
                        note.buildUser(context),
                      ),
                    )
                  : ListTile(
                      leading: Text(
                        note.buildDate(context),
                        style: GlobalVariables.completedNote,
                      ),
                      title: Text(
                        note.buildTitle(context),
                        style: GlobalVariables.completedNote,
                      ),
                      subtitle: Text(
                        note.buildDescription(context),
                        style: GlobalVariables.completedNote,
                      ),
                      trailing: Text(
                        note.buildUser(context),
                        style: GlobalVariables.completedNote,
                      ),
                    ),
            ),
          );
        },
      );
    }
  }
}
