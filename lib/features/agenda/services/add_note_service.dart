import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:mocha/constants/error_handling.dart';
import 'package:mocha/constants/utils.dart';

import 'package:mocha/models/note.dart';

import 'package:mocha/providers/user_provider.dart';

class AddNoteService {
  void addNote({
    required BuildContext context,
    required String title,
    required String description,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      Note note = Note(
        id: '',
        title: title,
        description: description,
        userId: userProvider.user.id,
        isCompleted: false
      );

      final res = await httpPost(context, 'notes/add-note', note.toJson());
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Note added successfully!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
