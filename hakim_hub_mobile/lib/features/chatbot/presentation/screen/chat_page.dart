import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

import '../../../../core/utils/pixle_to_percent.dart';
import '../../data/models/chat_institute_model.dart';
import '../../domain/entities/chat_doctor_entity.dart';
import '../../domain/entities/chat_institute_entity.dart';
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
    chatMessages = [];
    chatMessages.add([0, widget.chatBotIntialMessage]);
    print("init state");
    BlocProvider.of<ChatBotBloc>(context).add(GetChatResponseEvent(
        request: ChatRequest(
            message: widget.chatBotIntialMessage,
            address: "ipadhgjlpopoplkdress",
            isNew: true)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: Column(
        children: [
          BlocBuilder<ChatBotBloc, ChatBotState>(
            builder: (context, state) {
              if (state is ChatBotLoadingState ||
                  state is ChatBotInitialState) {
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
                                      chatMessage: chatMessages[index],
                                      index: index),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              } else if (state is ChatBotSuccessState) {
                print("check");
                chatMessages.add([1, state.chatResponse]);
                print(state.chatResponse);
                print(state.chatResponse.reply);
                print("after check");

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: chatMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatBox(
                                chatMessage: chatMessages[index]  , index: index),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              } else {
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
                                      chatMessage: chatMessages[index],
                                      index: index),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
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
                      chatMessages.add([0, query]);
                      BlocProvider.of<ChatBotBloc>(context).add(
                          GetChatResponseEvent(
                              request: ChatRequest(
                                  message: query,
                                  isNew: false,
                                  address: "ipadhgjlpopoplkdress")));
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
    required this.chatMessage,
    required this.index,
  });

  final chatMessage;
  final int index;
  @override
  Widget build(BuildContext context) {
    print(chatMessage);
    if (chatMessage[0] == 1) {
      print("object object ");
      print(chatMessage[1].reply);
      print("object object ");
    }
    return Padding(
      padding: EdgeInsets.only(
          left: chatMessage[0] == 0 ? pixleToPercent(30, "width").w : 0,
          right: chatMessage[0] == 1 ? pixleToPercent(30, "width").w : 0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: pixleToPercent(20, "width").w,
          vertical: pixleToPercent(14, "height").h,
        ),
        decoration: BoxDecoration(
          color: chatMessage[0] == 1
              ? const Color.fromRGBO(237, 237, 237, 1)
              : const Color.fromRGBO(104, 164, 244, 1),
        ),
        width: pixleToPercent(319, "width").w,
        child: Column(
          children: [
            Text(
              chatMessage[0] == 0 ? chatMessage[1] : chatMessage[1].reply,
              style: TextStyle(
                  fontSize: 14,
                  color: chatMessage[0] == 1 ? Colors.black : Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            chatMessage[0] == 1
                ? SizedBox(
                    width: 400,
                    height: 200,
                    child: ListView.builder(
                      itemCount: chatMessage[0] == 1
                          ? chatMessage[1].institutes.length
                          : 0,
                      itemBuilder: (BuildContext context, int i) {
                        return Column(
                          children: [
                            institutionCard(chatMessage[1].institutes[i]),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ),
    );
  }
}

Widget institutionCard(ChatInsituteModel chatInstituteEntity) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue, width: 2),
    ),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                chatInstituteEntity.logoUrl,
              ),
              onBackgroundImageError: (exception, stackTrace) {
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/doctor_image.png'),
                );
              },
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              chatInstituteEntity.instituteName,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            )
          ],
        ),
        chatInstituteEntity.doctors.isNotEmpty
            ? SizedBox(
                height: 100,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: ListView.builder(
                    itemCount: chatInstituteEntity.doctors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return doctor(chatInstituteEntity.doctors[index]);
                    },
                  ),
                ),
              )
            : Container()
      ],
    ),
  );
}

Widget doctor(ChatDoctorEntity chatDoctorEntity) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(chatDoctorEntity.photoUrl),
        onBackgroundImageError: (exception, stackTrace) {
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/doctor_image.png'),
          );
        },
        radius: 20,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            chatDoctorEntity.fullName,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Text(
            chatDoctorEntity.speciality,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 12),
          ),
        ],
      ),
    ],
  );
}
