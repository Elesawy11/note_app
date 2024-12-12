import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/font_styles.dart';

class TypeItemWidget extends StatelessWidget {
  const TypeItemWidget({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffA38FD7),
          maxRadius: 30.r,
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
        Text(
          text,
          style: FontStyles.font12Regular,
        )
      ],
    );
  }
}
