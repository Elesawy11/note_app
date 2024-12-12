import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'type_item_widget.dart';

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    required this.isClicked,
  });

  final bool isClicked;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      height: isClicked ? 200 : 0,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          typesList.length,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: TypeItemWidget(
              icon: typesList[index][0],
              text: typesList[index][1],
            ),
          ),
        ),
      ),
    );
  }
}

List<List<dynamic>> typesList = [
  [
    Icons.image_outlined,
    'Images',
  ],
  [
    Icons.brush_outlined,
    'Drawings',
  ],
  [
    Icons.link_outlined,
    'Links',
  ],
];
