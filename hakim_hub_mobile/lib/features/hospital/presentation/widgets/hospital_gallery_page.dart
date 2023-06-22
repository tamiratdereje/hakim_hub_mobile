import 'package:flutter/material.dart';
import 'package:hakim_hub_mobile/core/utils/ui_converter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GalleryTab extends StatelessWidget {
  const GalleryTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(UIConverter.getComponentWidth(context, 16)),
      child: MasonryGridView.builder(
        itemCount: 8,
        gridDelegate:
            SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UIConverter.getComponentWidth(context, 10),
            vertical: UIConverter.getComponentHeight(context, 10),
          ),
          child: Image.asset('assets/images/grid_images/image${index + 1}.jpg'),
        ),
      ),
    );
  }
}
