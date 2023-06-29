import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_institute_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_response_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/screen/chat_page.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/widgets/institution_card.dart';

class AiMessageCard extends StatelessWidget {
  final ChatResponseModel chatMessage;
  final Function navigateHospital;
  final Function navigateDoctor;

  AiMessageCard(
      {required this.chatMessage,
      required this.navigateDoctor,
      required this.navigateHospital});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
        decoration: const BoxDecoration(
          color: chatBoxColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Text(
              chatMessage.reply,
              style: const TextStyle(color: primaryTextColor),
            ),
            const SizedBox(
              height: 10,
            ),
            chatMessage.institutes.isNotEmpty
                ? SizedBox(
                    height: 280,
                    child: ListView.builder(
                      itemCount: chatMessage.institutes.length,
                      itemBuilder: (BuildContext context, int i) {
                        return Column(
                          children: [
                            institutionCard(chatMessage.institutes[i],
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
                : Container()
          ],
        ),
      ),
    );
  }
}
