import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildDescription(BuildContext context);
  Widget buildDate(BuildContext context);
  Widget buildUser(BuildContext context);
}

class MessageItem implements ListItem {
  final String title;
  final String description;
  final String date;
  final String user;

  MessageItem(this.title, this.description, this.date, this.user);

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
  Widget buildDate(BuildContext context) => Text(date);

  @override
  Widget buildUser(BuildContext context) => Text(user);
}
