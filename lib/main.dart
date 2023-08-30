import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/routes_manager.dart';
import 'package:notes_app/presentation/resources/theme_manager.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getTheme(),
      onGenerateRoute: AppRoute.getGenerateRoutes,
    );
  }
}
