import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';

abstract class FontStyles {
  static TextStyle font14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font24Bold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle font18Regular = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.regular,
  );
}
