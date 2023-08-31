import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/business_logic/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(InitialState());
}
