import 'package:flutter/material.dart';
  import 'package:notes_app/presentation/resources/values_manager.dart';

import '../widgets/custom_note_view.dart';
import '../widgets/model_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomNoteView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s20)),
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) => const AddNoteModelBottomSheet());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
