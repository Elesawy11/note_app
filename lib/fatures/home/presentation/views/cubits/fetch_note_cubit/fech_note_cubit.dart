import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:note_app/fatures/home/data/models/note_model.dart';

part 'fech_note_state.dart';

class FetchNoteCubit extends Cubit<FechNoteState> {
  FetchNoteCubit() : super(FechNoteInitial());
  List<NoteModel> notesList = [];
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection('notes');
  void fetchNotes() {
    emit(FechNoteLoading());
    try {
      firestore.snapshots().listen((event) {
        notesList.clear();
        notesList =
            event.docs.map((doc) => NoteModel.fromJson(doc.data())).toList();
        emit(FechNoteSuccess(notesList: notesList));
      });
    } catch (e) {
      emit(FechNoteFailure(e.toString()));
    }
  }
}
