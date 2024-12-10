import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/assets.dart';
import 'package:note_app/core/utils/font_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.validator});
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: 'Search notes',
        hintStyle: FontStyles.font14Regular,
        prefixIcon: const Icon(
          Icons.search_outlined,
        ),
        suffixIcon: Image.asset(
          width: 16.r,
          height: 16.r,
          Assets.assetsImagesAccount,
        ),
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
