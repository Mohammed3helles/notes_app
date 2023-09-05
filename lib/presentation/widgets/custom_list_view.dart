import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/get_note/get_note_cubit.dart';
import '../../data/model/note_model.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import 'note_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpace.p16),
      child: BlocBuilder<GetNoteCubit, GetNoteState>(builder: (context, state) {
        List<Note> notes = BlocProvider.of<GetNoteCubit>(context).notes ?? [];
        if (notes.isNotEmpty) {
          debugPrint('the length of notes is = ${notes.length}');
          return ListView.builder(
              reverse: false,
              padding: EdgeInsets.zero,
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteItem(
                  note: notes[index],
                );
              });
        } else {
          return Center(
            child: Text(
              AppStrings.noteIsNoteAvailable,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        }
      }),
    );
  }
}
