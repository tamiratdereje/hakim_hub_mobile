import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/write_chat.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/shared_widgets/bottom_nav.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/chat_welcome.dart';
import '../widgets/landing_page_question_card.dart';

class ChatLandingPage extends StatefulWidget {
  const ChatLandingPage({super.key});

  @override
  State<ChatLandingPage> createState() => _ChatLandingPageState();
}

class _ChatLandingPageState extends State<ChatLandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHSAppBar.build(context, "", () {}, true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const ChatWelcome(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Adaptive.w(6.5),
            ),
            child: Text(
              'use the power of AI to find a hospital suggestion based on your symptoms and preference',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Adaptive.sp(16)
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Adaptive.w(5.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ChatQuestionCard(),
                SizedBox(
                  height: Adaptive.h(4.4),
                ),
                const ChatQuestionCard(),
                SizedBox(
                  height: Adaptive.h(4.4),
                ),
                const ChatQuestionCard(),
              ],
            ),
          ),
          const WriteChat()
        ],
      ),
    );
  }
}
