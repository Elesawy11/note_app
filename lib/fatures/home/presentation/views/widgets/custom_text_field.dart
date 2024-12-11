import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/font_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, this.onChanged,
  });
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Search notes',
        hintStyle: FontStyles.font14Regular,
        prefixIcon: const Icon(
          Icons.search_outlined,
        ),
        suffixIcon: const Icon(Icons.person_outline),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder: outLineBorder(),
        enabledBorder: outLineBorder(),
        errorBorder: outLineBorder(),
        focusedErrorBorder: outLineBorder(),
      ),
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
