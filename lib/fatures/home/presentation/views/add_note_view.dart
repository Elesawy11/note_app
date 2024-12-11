import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/font_styles.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/presentation/views/widgets/custom_text_form_field.dart';

import 'widgets/custom_text_button.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffCFCCD4),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Title',
              onChanged: (p0) {},
            ),
            verticalSpace(24),
            Expanded(
              child: CustomTextFormField(
                hintText: 'content',
                onChanged: (p0) {},
                expands: true,
              ),
            ),
            CustomTextButton(onPressed: () {
              
            },)
          ],
        ),
      )),
    );
  }
}

