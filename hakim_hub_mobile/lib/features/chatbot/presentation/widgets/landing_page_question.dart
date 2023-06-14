import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

class ChatQuestionCard extends StatelessWidget {
  const ChatQuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Adaptive.w(3.75),
        vertical: Adaptive.w(2.16),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Text(
        'Can you recommend a hospital that specializes in [medical specialty] and has a good reputation for patient care?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: Adaptive.sp(15),
          fontWeight: FontWeight.w500,
          color: const Color.fromRGBO(0, 0, 0, 0.80),
        ),
      ),
    );
  }
}