import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_box.dart';
import 'package:hakim_hub_mobile/router/routes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/colors.dart';

class ChatLoadingScreen extends StatelessWidget {
  List chatMessages;
  ChatLoadingScreen({super.key, required this.chatMessages});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: chatMessages.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == chatMessages.length) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        chatMessage: chatMessages[index],
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
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
