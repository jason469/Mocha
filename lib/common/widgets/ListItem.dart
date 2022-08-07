import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ListItem {
  String buildId(BuildContext context);
  Widget buildTitle(BuildContext context);
  Widget buildDescription(BuildContext context);
  Widget buildDate(BuildContext context);
  Widget buildUser(BuildContext context);
}

class MessageItem implements ListItem {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String user;

  MessageItem(this.id, this.title, this.description, this.date, this.user);

  @override
  String buildId(BuildContext context) => id;

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildDescription(BuildContext context) => Text(description);

  @override
  Widget buildDate(BuildContext context) => Text(DateFormat('h:mm a').format(date));

  @override
  Widget buildUser(BuildContext context) => Text(user);
}
