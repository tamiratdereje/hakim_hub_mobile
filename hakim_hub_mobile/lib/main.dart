import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/core/splash_screen.dart';

import 'core/shared_widgets/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage()
    );
  }
}
