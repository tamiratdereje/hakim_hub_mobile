import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'core/shared_widgets/bottom_nav.dart';
import 'features/chatbot/presentation/screen/chat_landing.dart';
import 'features/doctor/presentation/screen/doctor_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ChatLandingPage(),
        );
      },
    );
  }
}
