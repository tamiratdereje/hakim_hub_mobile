import 'package:flutter/material.dart';

import 'Inner_card.dart';

class WebsiteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: websiteCard(),
    );
  }
}

class websiteCard extends StatelessWidget {
  const websiteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
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
                "website",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 10),
            buildinnercard(
                imagePath:
                    "/home/fenet/Desktop/hakim_hub_mobile/hakim_hub_mobile/hakim_hub_mobile/assets/images/website_icon.png",
                text: "www.blacklion.com"),
          ],
        ),
      ),
    );
  }
}
