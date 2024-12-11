import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/DI/service_locator.dart';
import 'package:note_app/core/utils/font_styles.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/cubit/add_note_cubit.dart';
import 'package:note_app/fatures/home/presentation/views/home_view.dart';
import 'package:note_app/fatures/home/presentation/views/widgets/custom_text_form_field.dart';

import 'widgets/custom_text_button.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<AddNoteCubit>();
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCFCCD4),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              } else if (state is AddNoteFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errMessage),
                  ),
                );
              }
            },
            builder: (context, state) {
              return state is AddNoteLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        CustomTextFormField(
                          controller: cubit.titleController,
                          hintText: 'Title',
                          onChanged: (p0) {},
                        ),
                        verticalSpace(24),
                        Expanded(
                          child: CustomTextFormField(
                            controller: cubit.contentController,
                            hintText: 'content',
                            onChanged: (p0) {},
                            expands: true,
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () => cubit.addNote(),
                        )
                      ],
                    );
            },
          ),
        )),
      ),
    );
  }
}
