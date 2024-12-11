import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/presentation/views/add_note_view.dart';
import 'widgets/custom_note_grid_view.dart';
import 'widgets/custom_text_form_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddNoteView(),
          ),
        ),
        child: const Icon(
          Icons.add_outlined,
        ),
      ),
      // backgroundColor: const Color(0xffCFCCD4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CustomTextFormField(
                suffixIcon: const Icon(Icons.person_outline),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                ),
                hintText: 'Search note',
                onChanged: (p0) {},
              ),
              verticalSpace(24),

              const Expanded(
                child: CustomNoteGridView(),
              ),
              // NoteItem(),
            ],
          ),
        ),
      ),
    );
  }
}
