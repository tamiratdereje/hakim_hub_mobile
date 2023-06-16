import 'package:flutter/material.dart';

import 'Inner_card.dart';

class PhoneCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 240, 239, 239),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
              ),
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 4, top: 15),
                child: Text(
                  "Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 4, top: 0),
                child: Text(
                  "Reception",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(height: 10),
              buildinnercard(
                  imagePath:
                      "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/phone-call_icon.png",
                  text: "+251920362814"),
              buildinnercard(
                  imagePath:
                      "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/phone-call_icon.png",
                  text: "+251920362814"),
            ],
          ),
        ),
      ),
    );
  }
}
