import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';

class UserChatCard extends StatelessWidget {
  final String chatMessage;

  UserChatCard({required this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 5, 10, 0),
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Text(
          chatMessage,
          style: const TextStyle(color: secondryTextColor),
        ),
      ),
    );
  }
}