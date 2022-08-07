import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ListItem {
  String buildId(BuildContext context);
  String buildTitle(BuildContext context);
  String buildDescription(BuildContext context);
  String buildDate(BuildContext context);
  String buildUserName(BuildContext context);
  bool buildIsCompleted(BuildContext context);
}

class MessageItem implements ListItem {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String userName;
  final bool isCompleted;

  MessageItem(this.id, this.title, this.description, this.date, this.userName,
      this.isCompleted);

  @override
  String buildId(BuildContext context) => id;

  @override
  String buildTitle(BuildContext context) => title;

  @override
  String buildDescription(BuildContext context) => description;

  @override
  String buildDate(BuildContext context) => DateFormat('h:mm a').format(date);

  @override
  String buildUserName(BuildContext context) => userName;

  @override
  bool buildIsCompleted(BuildContext context) => isCompleted;
}
