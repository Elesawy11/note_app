import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/note_model.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitial());
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  // int color = Colors.green.value;
  // final NoteModel note;
  Future<void> updateNote({required NoteModel note}) async {
    emit(UpdateNoteLoading());
    try {
      await notes.doc(note.id).update(NoteModel(
            title: titleController.text.isEmpty
                ? note.title
                : titleController.text,
            content: contentController.text.isEmpty
                ? note.content
                : contentController.text,
                color: note.color,
            id: note.id,
          ).toJson());

      emit(UpdateNoteSuccess());
    } catch (e) {
      emit(UpdateNoteFailure(e.toString()));
      // print(e.toString());
    }
  }
}
