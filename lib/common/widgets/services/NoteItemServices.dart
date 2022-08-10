import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mocha/constants/utils.dart';
import '../../../constants/error_handling.dart';
import '../../../features/agenda/screens/edit_note_screen.dart';

class NoteItemServices {
  Future<bool> markAsCompleted({
    required BuildContext context,
    required String id,
  }) async {
    try {
      final res = await httpPatch(context, 'notes/toggle-complete', id);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {},
      );
      return jsonDecode(res.body)["isCompleted"];
    } catch (e) {
      return false;
    }
  }

  void deleteNote({
    required BuildContext context,
    required String id,
  }) async {
    try {
      final res = await httpDelete(context, 'notes/delete-note', id);
      print(res.statusCode);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Note deleted successfully!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  editNote(context, widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditNoteScreen(note: widget.noteData.buildNote(context)),
      ),
    );
  }
}
