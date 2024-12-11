import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app/core/helpers/custom_snack_bar.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/fetch_note_cubit/fech_note_cubit.dart';

import 'note_item.dart';

class CustomNoteGridView extends StatelessWidget {
  const CustomNoteGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNoteCubit, FechNoteState>(
      listener: (context, state) {
        if (state is FechNoteFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return state is FechNoteSuccess
            ? MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 12.w,
                itemCount: state.notesList.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    color: state.notesList[index].color ?? Colors.green.value,
                    upText: state.notesList[index].title,
                    downText: state.notesList[index].content ?? "",
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
