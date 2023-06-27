import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/colors.dart';

import '../../../../core/utils/pixle_to_percent.dart';
import '../../../../router/routes.dart';
import '../../data/models/chat_institute_model.dart';
import '../../domain/entities/chat_doctor_entity.dart';
import '../../domain/entities/chat_request_entity.dart';
import '../bloc/chat_bot_bloc.dart';

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
          onTap: () => {Navigator.pop(context)},
          child: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        centerTitle: true,
        title: const Text(
          "Chat",
          style: const TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
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
                                    });
                              },
                              navigateDoctor: (doctorId) {
                                context.pushNamed(AppRoutes.DoctorDetailPage,
                                    queryParameters: {
                                      "id": doctorId,
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
                            itemCount: widget.chatMessages.length,
                            itemBuilder: (BuildContext context, int index) {
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
                                          });
                                    },
                                    navigateDoctor: (doctorId) {
                                      context.pushNamed(
                                          AppRoutes.DoctorDetailPage,
                                          queryParameters: {
                                            "id": doctorId,
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
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                );
              } else if (state is ChatBotSuccessState) {
                widget.chatMessages.add([1, state.chatResponse]);
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
                                    });
                              },
                              navigateDoctor: (doctorId) {
                                context.pushNamed(AppRoutes.DoctorDetailPage,
                                    queryParameters: {
                                      "id": doctorId,
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
                            itemCount: widget.chatMessages.length,
                            itemBuilder: (BuildContext context, int index) {
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
                                          });
                                    },
                                    navigateDoctor: (doctorId) {
                                      context.pushNamed(
                                          AppRoutes.DoctorDetailPage,
                                          queryParameters: {
                                            "id": doctorId,
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

  // void _sendMessage() async {

  // }
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
          borderRadius: BorderRadius.circular(10),
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
              height: 10,
            ),
            chatMessage[0] == 1 && chatMessage[1].institutes.isNotEmpty
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
                            institutionCard(chatMessage[1].institutes[i],
                                (instituteId) {
                              navigateHospital(instituteId);
                            }, (doctorId) {
                              navigateDoctor(doctorId);
                            }),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

Widget institutionCard(ChatInsituteModel chatInstituteEntity,
    Function navigateHosptial, Function navigateDoctor) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
        // border: Border.all(color: Colors.blue, width: 2),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey,
            blurStyle: BlurStyle.outer,
          )
        ],
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            navigateHosptial(chatInstituteEntity.instituteId);
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  chatInstituteEntity.logoUrl,
                ),
                onBackgroundImageError: (exception, stackTrace) {
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/doctor_image.png'),
                  );
                },
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  chatInstituteEntity.instituteName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
        ),
        chatInstituteEntity.doctors.isNotEmpty
            ? SizedBox(
                height: 100,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: ListView.builder(
                    itemCount: chatInstituteEntity.doctors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          GestureDetector(
                            child: doctor(
                              chatInstituteEntity.doctors[index],
                            ),
                            onTap: () {
                              navigateDoctor(
                                  chatInstituteEntity.doctors[index].id);
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          )
                        ],
                      );
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
        radius: 15,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            chatDoctorEntity.fullName,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          Text(
            chatDoctorEntity.speciality,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ],
      ),
    ],
  );
}
