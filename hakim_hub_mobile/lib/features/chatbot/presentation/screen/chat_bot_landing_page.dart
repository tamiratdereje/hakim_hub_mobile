import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/appBar.dart';

class ChatLandingPage extends StatefulWidget {
  const ChatLandingPage({super.key});

  @override
  State<ChatLandingPage> createState() => _ChatLandingPageState();
}

class _ChatLandingPageState extends State<ChatLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(
        context,
        "",
        () {},
        false,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Image.asset('name'),
              const Text('welcome to HakimHub'),
            ],
          ),
          const Text(
            'Use the power of AI to find a hospital suggestion based on your symptoms and preference',
          ),
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(237, 237, 237, 1),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
