import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/DI/service_locator.dart';
import 'package:note_app/core/utils/spacere.dart';
import 'package:note_app/fatures/home/presentation/views/add_note_view.dart';
import 'package:note_app/fatures/home/presentation/views/cubits/fetch_note_cubit/fech_note_cubit.dart';
import 'widgets/custom_note_grid_view.dart';
import 'widgets/custom_search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt.get<FetchNoteCubit>();
    return BlocProvider(
      create: (context) => cubit..fetchNotes(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddNoteView(),
            ),
          ),
          child: const Icon(
            Icons.add_outlined,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                CustomSearchWidget(cubit: cubit),
                verticalSpace(24),
                const Expanded(
                  child: CustomNoteGridView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
