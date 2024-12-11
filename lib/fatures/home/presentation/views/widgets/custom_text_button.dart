import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/font_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Text(
              text,
              style: FontStyles.font20Bold.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ));
  }
}
