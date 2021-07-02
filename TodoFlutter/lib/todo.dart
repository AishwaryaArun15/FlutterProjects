import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final DateTime date;
  Todo({@required this.title, @required this.date, @required this.id});
}
