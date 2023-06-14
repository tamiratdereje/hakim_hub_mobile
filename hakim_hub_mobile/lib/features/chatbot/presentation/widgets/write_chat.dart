import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';

class WriteChat extends StatelessWidget {
  const WriteChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.w(5.1),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Adaptive.w(7),
          // vertical: Adaptive.h(1),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            Adaptive.w(4.6),
          ),
        ),
        child: const TextField(
          decoration: InputDecoration(
            suffixIcon: send,
            hintText: 'Write a message ...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
