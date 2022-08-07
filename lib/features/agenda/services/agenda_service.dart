import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mocha/constants/utils.dart';

import 'package:mocha/common/widgets/ListItem.dart';
import 'package:mocha/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';

class AgendaService {
  Future<List<ListItem>> getNotes({
    required BuildContext context,
  }) async {
    List<ListItem> allNotes = [];

    try {
      final res = await httpGet(context, 'notes');
      var resBody = jsonDecode(res.body);
      for (var i = 0; i < resBody.length; i++) {
        var item = resBody[i];
        allNotes.add(
          MessageItem(
            item["_id"],
            item["title"],
            item["description"],
            DateTime.parse(item["date"]),
            item["userId"],
            item["isCompleted"],
          ),
        );
      }
      return allNotes;
    } catch (e) {
      return allNotes;
    }
  }
}
