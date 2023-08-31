import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/presentation/resources/values_manager.dart';
import '../../data/model/note_model.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(InitialState());

  addNote(Note note) async{
    emit(AddNoteLoadingState());
    try {
      var noteBox = Hive.box<Note>(kNoteBox);
      await noteBox.add(note);
      emit(AddNoteSuccessState());
    } catch (e) {
      emit(AddNoteFailedState(e.toString()));
    }
  }
}
