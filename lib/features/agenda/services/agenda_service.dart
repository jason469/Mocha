import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mocha/constants/utils.dart';

import 'package:mocha/common/widgets/ListItem.dart';

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
        print(item);
        allNotes.add(MessageItem(
            item["_id"],
            item["title"],
            item["description"],
            DateTime.parse(item["date"]),
            item["userId"])
        );
      }
      return allNotes;
    } catch (e) {
      print(e);
      return allNotes;
    }
  }
}
