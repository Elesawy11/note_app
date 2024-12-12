import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/constatn.dart';
import 'package:note_app/fatures/home/data/models/note_model.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/update_note_cubit/update_note_cubit.dart';

import 'color_item.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({
    super.key,
    this.onTap,
    required this.cubit,
    required this.note,
  });
  final void Function()? onTap;
  final UpdateNoteCubit cubit;
  final NoteModel note;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
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
                widget.note.color = colorsList[index].value;

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
