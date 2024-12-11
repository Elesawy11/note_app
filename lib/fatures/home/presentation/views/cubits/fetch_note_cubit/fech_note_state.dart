part of 'fech_note_cubit.dart';

@immutable
sealed class FechNoteState {}

final class FechNoteInitial extends FechNoteState {}

final class FechNoteLoading extends FechNoteState {}

final class FechNoteSuccess extends FechNoteState {
  final List<NoteModel> notesList;

  FechNoteSuccess({required this.notesList});
}

final class FechNoteFailure extends FechNoteState {
  final String errMessage;

  FechNoteFailure(this.errMessage);
}
