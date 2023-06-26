import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

import '../../../../core/utils/pixle_to_percent.dart';
import '../../domain/entities/chat_request_entity.dart';
import '../bloc/chat_bot_bloc.dart';

class ChatPage extends StatefulWidget {
  String chatBotIntialMessage;
  ChatPage({required this.chatBotIntialMessage, super.key});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  List chatMessages = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatBotBloc>(context).add(GetChatResponseEvent(
        request: ChatRequest(message: widget.chatBotIntialMessage, address: "", isNew: true)));
  }

  @override
  Widget build(BuildContext context) {
    chatMessages.add([0 ,widget.chatBotIntialMessage]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          BlocBuilder<ChatBotBloc, ChatBotState>(
            builder: (context, state) {
              if (state is ChatBotLoadingState || state is ChatBotInitialState) {
                return  Expanded(
                  child: Column(
                    children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: chatMessages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ChatBox(
                                    chatMessages: chatMessages, index: index),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                     Padding(padding: EdgeInsets.only(top:20),),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],),
                );
                
              } else if (state is ChatBotSuccessState) {
                chatMessages.add([1, state.chatResponse]);
                return Expanded(
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
                );
              } else  {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: chatMessages.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ChatBox(
                                      chatMessages: chatMessages, index: index),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top:20),),
                      const Text(
                        "error while loading",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                
                
                
                
                    ],
                    // child: Text('Error'),
                  ),
                );
              }

              
            },
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
                        border: InputBorder.none,
                        hintText: 'Write a message ...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      String query = _textEditingController.text;
                      _textEditingController.clear();

                      print("object object ");
                      print("object object ");
                      print("object object ");
                      print("object object ");
                      print("object object ");
                      print("object object ");

                      BlocProvider.of<ChatBotBloc>(context).add(
                          GetChatResponseEvent(
                              request: ChatRequest(
                                  message: query, isNew: false, address: "0")));

                      setState(() {
                        chatMessages.add([0, query]);
                      });
                      
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

  // void _sendMessage() async {

  // }
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
              chatMessages[index][1].toString(),
              style: TextStyle(
                  fontSize: 14,
                  color: chatMessages[index][0] == 1
                      ? Colors.black
                      : Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: 400,
              // chatMessages[index][0] == 1 ? 
              height: 200,
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      chatMessages[index][0] == 1
                          ? institutionCard(1)
                          : Container(),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget institutionCard(index) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
    ),
    child: Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/hospital_img.png',
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Tikur Ambessa',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            )
          ],
        ),
        index == 1
            ? SizedBox(
                height: 100,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return doctor();
                    },
                  ),
                ),
              )
            : Text('')
      ],
    ),
  );
}

Widget doctor() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/doctor_image.png'),
        radius: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dr. Habtamu Doe',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Text(
            'Neurologist',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    ],
  );
}
