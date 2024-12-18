import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:note_app/fatures/home/data/models/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  int color = Colors.green.value;
  Future<void> addNote() async {
    emit(AddNoteLoading());
    try {
      await notes
          .add(NoteModel(
            id: '0',
            color: color,
            title: titleController.text,
            content: contentController.text,
          ).toJson())
          .then((value) => notes.doc(value.id).update({'id': value.id}))
          .catchError((error) => print("Failed to add user: $error"));
      emit(AddNoteSuccess());
      // await close();
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
      // print(e.toString());
    }
  }

  @override
  Future<void> close() {
    titleController.dispose();
    contentController.dispose();

    return super.close();
  }
}
