import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakim_hub_mobile/core/utils/pixle_to_percent.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/bloc/chat_bot_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/colors.dart';
import '../../domain/entities/chat_request_entity.dart';

// ignore: must_be_immutable
class MessageInputCard extends StatelessWidget {
  List chatMessages;
  final TextEditingController _textEditingController = TextEditingController();
  MessageInputCard({super.key, required this.chatMessages});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  chatMessages.add([0, query]);
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
              icon: const Icon(
                Icons.send,
                color: primaryColor,
              ),
              onPressed: () {
                String query = _textEditingController.text;
                _textEditingController.clear();
                chatMessages.add([0, query]);
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
    );
  }
}
