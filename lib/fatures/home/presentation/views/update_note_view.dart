import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/DI/service_locator.dart';
import 'package:note_app/core/helpers/custom_snack_bar.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/data/models/note_model.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/update_note_cubit/update_note_cubit.dart';
import 'package:note_app/fatures/home/presentation/views/home_view.dart';
import 'package:note_app/fatures/home/presentation/views/widgets/custom_text_form_field.dart';
import 'package:note_app/fatures/home/presentation/views/widgets/edit_color_list_view.dart';

import 'widgets/custom_text_button.dart';

class UpdateNoteView extends StatelessWidget {
  const UpdateNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<UpdateNoteCubit>();
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCFCCD4),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocConsumer<UpdateNoteCubit, UpdateNoteState>(
            listener: (context, state) {
              if (state is UpdateNoteSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              } else if (state is UpdateNoteFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return state is UpdateNoteLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: cubit.titleController,
                            hintText: note.title,
                          ),
                          verticalSpace(24),
                          Expanded(
                            child: CustomTextFormField(
                              controller: cubit.contentController,
                              hintText: note.content ?? 'content',
                              expands: true,
                            ),
                          ),
                          EditColorListView(cubit: cubit, note: note),
                          CustomTextButton(
                            text: 'Update Note',
                            onPressed: () {
                              cubit.updateNote(note: note);
                            },
                          ),
                        ],
                      ),
                    );
            },
          ),
        )),
      ),
    );
  }
}
