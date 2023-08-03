// gallery_tab_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_page_widgets/hospital_gallery_page.dart';


void main() {
  test('displays images from list', () {
    final images = [
      'https://example.com/image1.jpg',
      'https://example.com/image2.jpg',
    ];

    expect(
      GalleryTab(images: images),
      matchesGoldenFile('gallery_tab.png'),
    );
  });
}
