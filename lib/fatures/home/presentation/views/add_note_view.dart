import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/DI/service_locator.dart';
import 'package:note_app/core/helpers/custom_snack_bar.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/fatures/home/presentation/views/widgets/color_list_view.dart';
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
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const HomeView(),
                //   ),
                // );
                // cubit.close();
              } else if (state is AddNoteFailure) {
                customSnackBar(context, state.errMessage);
              }
            },
            builder: (context, state) {
              return state is AddNoteLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: cubit.formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: cubit.titleController,
                            hintText: 'Title',
                            validator: (value) {
                              if (value?.isEmpty ?? true) {
                                return 'Failed is required';
                              } else {
                                return null;
                              }
                            },
                          ),
                          verticalSpace(24),
                          Expanded(
                            child: CustomTextFormField(
                              controller: cubit.contentController,
                              hintText: 'content',
                              expands: true,
                            ),
                          ),
                          ColorListView(
                            cubit: cubit,
                          ),
                          CustomTextButton(
                            text: 'Add Note',
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.formKey.currentState!.save();

                                cubit.addNote();
                              }
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
