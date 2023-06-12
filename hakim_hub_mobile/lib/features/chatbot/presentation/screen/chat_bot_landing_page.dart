import 'package:flutter/material.dart';

import '../../../../core/shared_widgets/appBar.dart';
import '../../../../core/utils/icons.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/HakimHubVectorImg.png'),
                  Image.asset('assets/images/HakimHub.png')
                ],
              ),
              const Text('welcome to HakimHub'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Use the power of AI to find a hospital suggestion based on your symptoms and preference',
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                  child: const Text(
                      'Can you recommend a hospital that specializes in [medical specialty] and has a good reputation for patient care?"'),
                ),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                  child: const Text(
                      'Can you recommend a hospital that specializes in [medical specialty] and has a good reputation for patient care?"'),
                ),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(237, 237, 237, 1),
                  ),
                  child: const Text(
                      'Can you recommend a hospital that specializes in [medical specialty] and has a good reputation for patient care?"'),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 31),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(26)),
                color: Color.fromRGBO(237, 237, 237, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Write a message ...'),
                  IconButton(
                    onPressed: () {},
                    icon: send,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
