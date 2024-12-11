import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/constatn.dart';
import 'package:note_app/fatures/home/data/models/note_model.dart';
import 'package:note_app/fatures/home/presentation/views/update_note_view.dart';

import '../../../../../core/utils/font_styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdateNoteView(
          note: note,
        ),
      )),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color ?? colorsList[0].value),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              dense: true,
              title: Padding(
                padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
                child: Text(
                  note.title,
                  style: FontStyles.font24Bold,
                ),
              ),
              subtitle: Text(
                note.content ?? "",
                style: FontStyles.font18Regular.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
