import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIConverter.getComponentWidth(context, 16)),
      child: GridView.builder(
        itemCount: 8, // Replace with the number of images you want to display
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: UIConverter.getComponentWidth(context, 200),
          childAspectRatio: 1,
          crossAxisSpacing: UIConverter.getComponentWidth(context, 10),
          mainAxisSpacing: UIConverter.getComponentWidth(context, 10),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            'assets/images/black_lion.png',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
