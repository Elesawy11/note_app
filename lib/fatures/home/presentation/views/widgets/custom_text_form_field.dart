import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.validator,
    this.expands,
    required this.hintText,
    this.maxLines,
    this.prefixIcon, this.suffixIcon, this.controller,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? expands;
  final String hintText;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      textAlignVertical: TextAlignVertical.top,
      maxLines: null,
      // minLines: null,
      expands: expands ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: FontStyles.font14Regular,
        prefixIcon: prefixIcon,
        suffixIcon:suffixIcon ,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: outLineBorder(),
        enabledBorder: outLineBorder(),
        errorBorder: outLineBorder(),
        focusedErrorBorder: outLineBorder(),
      ),
      validator: validator,
    );
  }

  OutlineInputBorder outLineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(24.0.r),
    );
  }
}
