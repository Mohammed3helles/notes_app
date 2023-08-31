import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/presentation/resources/routes_manager.dart';
import 'package:notes_app/presentation/resources/theme_manager.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      onGenerateRoute: AppRoute.getGenerateRoutes,
    );
  }
}
