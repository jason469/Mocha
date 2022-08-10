import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mocha/constants/utils.dart';
import '../../../constants/error_handling.dart';

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
}
