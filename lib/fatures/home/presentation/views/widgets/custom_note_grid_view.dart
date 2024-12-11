import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'note_item.dart';

class CustomNoteGridView extends StatelessWidget {
  const CustomNoteGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      gridDelegate:
          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 16.h,
      crossAxisSpacing: 12.w,
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return NoteItem(
          upText: itemsList[index][0],
          downText: itemsList[index][1],
        );
      },
    );
  }
}



List<List<String>> itemsList = [
  [
    'Hello',
    'Ahmed Elesawy',
  ],
  [
    'Hello Ahmed Elesawy',
    '''Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
     ''',
  ],
  [
    'Hello Ahmed Elesawy',
    '''Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
     ''',
  ],
  [
    'Hello',
    'Ahmed Elesawy',
  ],
  [
    'Hello',
    'Ahmed Elesawy',
  ],
  [
    'Hello Ahmed Elesawy',
    '''Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
     ''',
  ],
  [
    'Hello Ahmed Elesawy',
    '''Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
Hello Ahmed
My name is Ahmed
How are you
     ''',
  ],
  [
    'Hello',
    'Ahmed Elesawy',
  ],
];
