import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/pixle_to_percent.dart';
import '../../../../core/utils/ui_converter.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List chatMessages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      ChatBox(chatMessages: chatMessages, index: index),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Adaptive.w(5.1),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: pixleToPercent(46, "width"),
                vertical: pixleToPercent(20, "width"),
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(
                  Adaptive.w(4.6),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'Write a message ...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ),
          // writeChatField(_textEditingController, _sendMessage)
        ],
      ),
    );
  }

  void _sendMessage() async {
    String query = _textEditingController.text;
    _textEditingController.clear();

    String response =
        "Remember to also import the necessary files and ensure that the pixelToPercent() function is correctly implemented in your pixle_to_percent.dart file.";

    setState(() {
      chatMessages.add([0, query]);
      chatMessages.add([1, response]);
    });
  }
}

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
    required this.chatMessages,
    required this.index,
  });

  final List chatMessages;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: chatMessages[index][0] == 0 ? pixleToPercent(30, "width").w : 0,
          right:
              chatMessages[index][0] == 1 ? pixleToPercent(30, "width").w : 0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: pixleToPercent(20, "width").w,
          vertical: pixleToPercent(14, "height").h,
        ),
        decoration: BoxDecoration(
          color: chatMessages[index][0] == 1
              ? Color.fromRGBO(237, 237, 237, 1)
              : Color.fromRGBO(104, 164, 244, 1),
        ),
        width: pixleToPercent(319, "width").w,
        child: Column(
          children: [
            Text(
              chatMessages[index][1],
              style: TextStyle(
                  fontSize: 16,
                  color: chatMessages[index][0] == 1
                      ? Colors.black
                      : Colors.white),
            ),
            institutionCard(1),
          ],
        ),
      ),
    );
  }
}

Widget institutionCard(index) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
    ),
    child: Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              child: Image(
                image: NetworkImage(
                    'data:image/jpeg;base64,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'),
              ),
            ),
            Text('Tikur Ambessa')
          ],
        ),
        index == 1
            ? Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: ListView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return doctor();
                  },
                ),
              )
            : Text('')
      ],
    ),
  );
}

Widget doctor() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
        image: AssetImage('assets/images/doctor_image.png'),
      ))),
      const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Dr. Habtamu Doe'),
          Text('Neurologist'),
        ],
      ),
    ],
  );
}
