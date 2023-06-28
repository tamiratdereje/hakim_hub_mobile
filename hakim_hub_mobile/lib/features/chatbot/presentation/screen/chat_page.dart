import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
                                          color: Colors.blue,
                                          size: 40,
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
        left: chatMessage[0] == 0 ? pixleToPercent(60, "width").w : 0,
        right: chatMessage[0] == 1 ? pixleToPercent(60, "width").w : 0,
      ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chatMessage[0] == 0 ? chatMessage[1] : chatMessage[1].reply,
              style: TextStyle(
                  fontSize: 14,
                  color: chatMessage[0] == 1 ? Colors.black : Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            chatMessage[0] == 1 && chatMessage[1].institutes.isNotEmpty
                ? SizedBox(
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
                width: 12,
              ),
              Expanded(
                child: HoverBuilder(
                  builder: (isHovered) {
                    return Text(
                      chatInstituteEntity.instituteName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isHovered ? Colors.blue : Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        chatInstituteEntity.doctors.isNotEmpty
            ? SizedBox(
                height: 100,
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: ListView.builder(
                    itemCount: chatInstituteEntity.doctors.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: GestureDetector(
                              child: doctor(
                                chatInstituteEntity.doctors[index],
                              ),
                              onTap: () {
                                navigateDoctor(
                                    chatInstituteEntity.doctors[index].id);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(237, 237, 237, 1),
      boxShadow: const [
        BoxShadow(
          blurRadius: 5,
          color: Colors.grey,
          blurStyle: BlurStyle.outer,
        )
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
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
            HoverBuilder(
              builder: (isHovered) {
                return Text(
                  chatDoctorEntity.fullName,
                  style: TextStyle(
                    color: isHovered ? Colors.blue : Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            Text(
              chatDoctorEntity.speciality,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(131, 33, 149, 243),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
