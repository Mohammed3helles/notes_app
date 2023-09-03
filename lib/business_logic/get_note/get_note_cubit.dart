import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';

import '../../data/model/note_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  List<Note>? notes;

  getNotes() async {
    //here GetNoteLoading is used because is not use any future and await
    // emit(GetNoteLoading());
    var noteBox = Hive.box<Note>(kNoteBox);
    notes = noteBox.values.toList();
  }
}
