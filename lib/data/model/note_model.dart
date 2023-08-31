import 'package:flutter/cupertino.dart';

class Note {
  final int? id;
  final String? title;
  final String? description;
  final String? date;
  final Color? color;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
