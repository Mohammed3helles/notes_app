import 'package:flutter/material.dart';
 import 'package:notes_app/data/model/note_model.dart';
import 'package:notes_app/presentation/resources/strings_manager.dart';
import 'package:notes_app/presentation/screens/edit_note_screen.dart';
import 'package:notes_app/presentation/screens/notes_screen.dart';

class AppRoute {
  static const String noteScreen = "/";
  static const String editScreen = "/ Edit Note Screen";

  static Route<dynamic> getGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case noteScreen:
        return MaterialPageRoute(builder: (_) => const NotesView());
      case editScreen:
        return MaterialPageRoute(builder: (_) {
          final Note note=settings.arguments as Note;
          return  EditNoteScreen(note: note,);
        });
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.unDefinedRoute),
              ),
            ));
  }
}
