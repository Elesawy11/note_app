import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/fetch_note_cubit/fech_note_cubit.dart';
import 'custom_animated_container.dart';
import 'custom_text_form_field.dart';

class CustomSearchWidget extends StatefulWidget {
  const CustomSearchWidget({
    super.key,
    required this.cubit,
  });

  final FetchNoteCubit cubit;

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      // clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 60.h,
          child: CustomTextFormField(
            borderRadius: isClicked
                ? BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r),
                  )
                : null,
            onTap: () {
              isClicked = true;
              setState(() {});
            },
            suffixIcon: isClicked
                ? TextButton(
                    onPressed: () {
                      isClicked = false;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.mic,
                    ),
                  )
                : const Icon(Icons.person_outline),
            prefixIcon: isClicked
                ? TextButton(
                    onPressed: () {
                      isClicked = false;
                      setState(() {});
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  )
                : const Icon(
                    Icons.search_outlined,
                  ),
            hintText: 'Search note',
            onChanged: (value) => widget.cubit
                .fetchNotes(isEqualTo: value.isEmpty ? null : value),
          ),
        ),
        isClicked
            ? CustomAnimatedContainer(isClicked: isClicked)
            : const Center(),
      ],
    );
  }
}
