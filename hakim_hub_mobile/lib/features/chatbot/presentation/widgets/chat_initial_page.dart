import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_box.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

class ChatInitialPage extends StatelessWidget {
  List chatMessages;
  ChatInitialPage({super.key, required this.chatMessages});

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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.red[200],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: const Text(
                                "Pleased check your network",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )
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
        ],
        // child: Text('Error'),
      ),
    );
  }
}
