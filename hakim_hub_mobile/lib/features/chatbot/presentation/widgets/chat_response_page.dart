import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/chat_box.dart';
import 'package:hakim_hub_mobile/router/routes.dart';

class ChatResponseScreen extends StatelessWidget {
  List chatMessages;
  ChatResponseScreen({super.key, required this.chatMessages});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: chatMessages.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ChatBox(
                  chatMessage: chatMessages[index],
                  index: index,
                  navigateHospital: (instituteId) {
                    context.pushNamed(AppRoutes.HospitalDetailPage,
                        queryParameters: {"id": instituteId, "prevIndex": "1"});
                  },
                  navigateDoctor: (doctorId) {
                    context.pushNamed(AppRoutes.DoctorDetailPage,
                        queryParameters: {"id": doctorId, "prevIndex": "1"});
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
  }
}
