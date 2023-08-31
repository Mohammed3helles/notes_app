abstract class AddNoteState {}

class InitialState extends AddNoteState {}

class AddNoteLoadingState extends AddNoteState {}

class AddNoteSuccessState extends AddNoteState {}

class AddNoteFailedState extends AddNoteState {
  final String errorMessage;

  AddNoteFailedState(this.errorMessage);
}
