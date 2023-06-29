import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_response_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_institute_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/ai_response_card.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/user_message_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/hover_builder.dart';

import '../../../../core/utils/pixle_to_percent.dart';
import '../../../../router/routes.dart';
import '../../data/models/chat_institute_model.dart';
import '../../domain/entities/chat_doctor_entity.dart';
import '../../domain/entities/chat_request_entity.dart';
import '../bloc/chat_bot_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ChatPage extends StatefulWidget {
  // String chatBotIntialMessage;
  List chatMessages;
  ChatPage({required this.chatMessages, super.key});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textEditingController = TextEditingController();
  // List chatMessages = [];

  @override
  void initState() {
    super.initState();
    print(widget.chatMessages);
    // widget.chatMessages.add([0, widget.chatBotIntialMessage]);
    BlocProvider.of<ChatBotBloc>(context).add(GetChatResponseEvent(
        request: ChatRequest(
            message: widget.chatMessages[0][1],
            address: "ipadhgjlpopoplkdress",
            isNew: true)));
  }

  void clearChat() {
    setState(() {
      widget.chatMessages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => {
            clearChat(),
            BlocProvider.of<ChatBotBloc>(context).add(SetIntialStateEvent()),
            context.goNamed(AppRoutes.Home, queryParameters: {
              "index": "1",
            }),
          },
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              clearChat();
              BlocProvider.of<ChatBotBloc>(context).add(SetIntialStateEvent());
              context.goNamed(AppRoutes.Home, queryParameters: {
                "index": "1",
              });
            },
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          BlocBuilder<ChatBotBloc, ChatBotState>(
            builder: (context, state) {
              if (state is ChatBotInitialState) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: widget.chatMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatBox(
                              chatMessage: widget.chatMessages[index],
                              index: index,
                              navigateHospital: (instituteId) {
                                context.pushNamed(AppRoutes.HospitalDetailPage,
                                    queryParameters: {
                                      "id": instituteId,
                                      "prevIndex": "1"
                                    });
                              },
                              navigateDoctor: (doctorId) {
                                context.pushNamed(AppRoutes.DoctorDetailPage,
                                    queryParameters: {
                                      "id": doctorId,
                                      "prevIndex": "1"
                                    });
                              },
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              } else if (state is ChatBotLoadingState) {
                return Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemCount: widget.chatMessages.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == widget.chatMessages.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        LoadingAnimationWidget.waveDots(
                                          color: primaryColor,
                                          size: 30,
                                        ),
                                      ]),
                                );
                              }
                              return Column(
                                children: [
                                  ChatBox(
                                    chatMessage: widget.chatMessages[index],
                                    index: index,
                                    navigateHospital: (instituteId) {
                                      context.pushNamed(
                                          AppRoutes.HospitalDetailPage,
                                          queryParameters: {
                                            "id": instituteId,
                                            "prevIndex": "1"
                                          });
                                    },
                                    navigateDoctor: (doctorId) {
                                      context.pushNamed(
                                          AppRoutes.DoctorDetailPage,
                                          queryParameters: {
                                            "id": doctorId,
                                            "prevIndex": "1"
                                          });
                                    },
                                  ),
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
                    ],
                  ),
                );
              } else if (state is ChatBotSuccessState) {
                widget.chatMessages.add([1, state.chatResponse]);
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: widget.chatMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatBox(
                              chatMessage: widget.chatMessages[index],
                              index: index,
                              navigateHospital: (instituteId) {
                                context.pushNamed(AppRoutes.HospitalDetailPage,
                                    queryParameters: {
                                      "id": instituteId,
                                      "prevIndex": "1"
                                    });
                              },
                              navigateDoctor: (doctorId) {
                                context.pushNamed(AppRoutes.DoctorDetailPage,
                                    queryParameters: {
                                      "id": doctorId,
                                      "prevIndex": "1"
                                    });
                              },
                            ),
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
                            itemCount: widget.chatMessages.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == widget.chatMessages.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              color: Colors.red[200],
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15))),
                                          child: const Text(
                                            "Pleased check your network",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        )
                                      ]),
                                );
                              }
                              return Column(
                                children: [
                                  ChatBox(
                                    chatMessage: widget.chatMessages[index],
                                    index: index,
                                    navigateHospital: (instituteId) {
                                      context.pushNamed(
                                          AppRoutes.HospitalDetailPage,
                                          queryParameters: {
                                            "id": instituteId,
                                            "prevIndex": "1"
                                          });
                                    },
                                    navigateDoctor: (doctorId) {
                                      context.pushNamed(
                                          AppRoutes.DoctorDetailPage,
                                          queryParameters: {
                                            "id": doctorId,
                                            "prevIndex": "1"
                                          });
                                    },
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              );
                            },
                          ),
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
            padding: const EdgeInsets.all(10.0),
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
                      onSubmitted: (value) {
                        String query = _textEditingController.text;
                        _textEditingController.clear();
                        widget.chatMessages.add([0, query]);
                        BlocProvider.of<ChatBotBloc>(context).add(
                          GetChatResponseEvent(
                            request: ChatRequest(
                                message: query,
                                isNew: false,
                                address: "ipadhgjlpopoplkdress"),
                          ),
                        );
                      },
                      textInputAction: TextInputAction.done,
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
                      widget.chatMessages.add([0, query]);
                      BlocProvider.of<ChatBotBloc>(context).add(
                        GetChatResponseEvent(
                          request: ChatRequest(
                              message: query,
                              isNew: false,
                              address: "ipadhgjlpopoplkdress"),
                        ),
                      );
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
}

class ChatBox extends StatelessWidget {
  Function navigateDoctor;
  Function navigateHospital;
  ChatBox(
      {super.key,
      required this.chatMessage,
      required this.index,
      required this.navigateDoctor,
      required this.navigateHospital});

  final chatMessage;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: chatMessage[0] == 0 ? pixleToPercent(30, "width").w : 0,
        right: chatMessage[0] == 1 ? pixleToPercent(30, "width").w : 0,
      ),
      child: chatMessage[0] == 0
          ? UserChatCard(chatMessage: chatMessage[1])
          : AiMessageCard(
              chatMessage: chatMessage[1],
              navigateDoctor: navigateDoctor,
              navigateHospital: navigateHospital),
      
    );
  }
}




