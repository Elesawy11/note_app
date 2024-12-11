import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/font_styles.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,
    required this.upText,
    required this.downText,
  });
  final String upText, downText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // color: Color(noteModel.color),
        color: Colors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            dense: true,
            title: Padding(
              padding: EdgeInsets.only(top: 18.h, bottom: 16.h),
              child: Text(
                upText,
                style: FontStyles.font24Bold,
              ),
            ),
            subtitle: Text(
              downText,
              style: FontStyles.font18Regular.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
