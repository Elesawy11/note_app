import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/constatn.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/add_note_cubit/add_note_cubit.dart';

import 'color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({
    super.key,
    this.onTap,
    required this.cubit,
  });
  final void Function()? onTap;
  final AddNoteCubit cubit;
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.cubit.color = colorsList[index].value;

                setState(() {});
              },
              child: ColorItem(
                color: colorsList[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        }),
      ),
    );
  }
}
