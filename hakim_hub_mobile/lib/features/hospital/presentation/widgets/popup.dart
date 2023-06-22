import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/phone_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/website_card.dart';

import 'email_card.dart';

class popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showPopUpCard(context);
          },
          child: Text('Show Pop-up Card'),
        ),
      ),
    );
  }
}

void showPopUpCard(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center();
      });
}
