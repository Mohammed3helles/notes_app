import 'package:flutter/material.dart';
import 'package:notes_app/presentation/resources/strings_manager.dart';

import '../widgets/custom_note_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  const CustomNoteView(),
    );
  }
}



