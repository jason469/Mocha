import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:mocha/constants/error_handling.dart';
import 'package:mocha/constants/utils.dart';

import 'package:mocha/models/note.dart';

import 'package:mocha/providers/user_provider.dart';

class EditNoteService {
  void editNote({
    required BuildContext context,
    required String title,
    required String description,
    required String noteId,
  }) async {
    try {
      Map<String, dynamic> noteData = {
        "title": title,
        "description": description,
        "noteId": noteId
      };

      final res = await httpPatch(context, 'notes/edit-note', noteData);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Note edited successfully!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
