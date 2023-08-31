import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';
// flutter pub run build_runner build this code to use build runner
@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final String? date;
  @HiveField(3)
  final Color? color;

  Note({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
