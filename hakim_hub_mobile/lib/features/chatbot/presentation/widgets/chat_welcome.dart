import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatWelcome extends StatelessWidget {
  const ChatWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/HakimHubVectorImg.png',
              width: Adaptive.w(
                11,
              ),
            ),
            SizedBox(
              width: Adaptive.h(1.62),
            ),
            Image.asset(
              'assets/images/HakimHub.png',
              width: Adaptive.w(
                31.5,
              ),
            )
          ],
        ),
        SizedBox(
          height: Adaptive.h(1.07),
        ),
        Text(
          'Welcome to HakimHub',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: Adaptive.sp(20) ),
        )
      ],
    );
  }
}