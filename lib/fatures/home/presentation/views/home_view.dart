import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'widgets/custom_text_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffCFCCD4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (p0) {},
              ),
              verticalSpace(24),

              Expanded(
                child: MasonryGridView.builder(
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
                ),
              ),
              // NoteItem(),
            ],
          ),
        ),
      ),
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
