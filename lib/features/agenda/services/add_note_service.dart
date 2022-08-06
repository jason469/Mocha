import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:mocha/constants/error_handling.dart';
import 'package:mocha/constants/global_variables.dart';
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
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/add-note'),
        body: note.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            "Note created successfully!",
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
