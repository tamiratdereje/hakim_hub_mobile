import 'package:flutter/material.dart';

class CHSAppBar {
  static PreferredSizeWidget build(
      BuildContext context, String text, Function onPressed, bool hasPop) {
    return AppBar(
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 2,
        leading: GestureDetector(
          onTap: () => {
            if (hasPop) {Navigator.pop(context)}
          },
          child: const Icon(Icons.chat_bubble_outline_rounded,
              color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white);
  }
}
