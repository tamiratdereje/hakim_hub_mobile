import 'package:flutter/material.dart';

class buildinnercardWeb extends StatelessWidget {
  const buildinnercardWeb({
    required this.imagePath,
    required this.text,
  });

  final String imagePath;
  final TextButton text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Card(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 110, 110, 110).withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: ListTile(
            tileColor: Colors.white,
            title: text,
            leading: Container(
              
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
              ),
              child: Image.asset(
                imagePath,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}