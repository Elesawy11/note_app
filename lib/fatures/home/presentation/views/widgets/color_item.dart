import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem(
      {super.key,
      required this.isActive,
      required this.color,
      this.backgroundColor});
  final bool isActive;
  final Color color;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: backgroundColor ?? Colors.white,
            radius: 32,
            child: CircleAvatar(
              radius: 29,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 29,
            backgroundColor: color,
          );
  }
}
