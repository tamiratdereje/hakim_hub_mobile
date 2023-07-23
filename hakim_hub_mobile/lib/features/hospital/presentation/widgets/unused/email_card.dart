import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';

import '../Inner_card.dart';

class EmailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: popup_email(),
    );
  }
}

class popup_email extends StatelessWidget {
  const popup_email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 240, 239, 239),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 4, top: 15),
              child: Text(
                "Email",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildinnercard(
                imagePath: "assets/images/email_icon.png",
                text: "No email found"),
          ],
        ),
      ),
    );
  }
}
