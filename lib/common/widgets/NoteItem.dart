import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final BuildContext context;
  final AsyncSnapshot snapshot;

  const NoteItem({Key? key, required this.context, required this.snapshot})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!snapshot.hasData) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          final note = snapshot.data[index];
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
                  return false;
                } else {
                  final snackbarController =
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Deleted ${note.title}'),
                      action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {}),
                    ),
                  );
                  await snackbarController.closed;
                  return true;
                }
              },
              child: ListTile(
                leading: note.buildDate(context),
                title: note.buildTitle(context),
                subtitle: note.buildDescription(context),
                trailing: note.buildUser(context),
              ),
            ),
          );
        },
      );
    }
  }
}
