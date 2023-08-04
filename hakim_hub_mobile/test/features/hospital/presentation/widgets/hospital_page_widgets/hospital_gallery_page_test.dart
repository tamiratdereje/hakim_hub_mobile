import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_page_widgets/hospital_gallery_page.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('GalleryTab correctly loads images from the network',
      (WidgetTester tester) async {
    // Define a list of image URLs for testing
    final List<String> testImages = [
      'http://image1.com',
      'http://image2.com',
      'http://image3.com',
    ];

    // Wrapping the test in a mockNetworkImagesFor function to provide mocked network images.
    mockNetworkImagesFor(() async {
      // Build the GalleryTab widget
      await tester.pumpWidget(MaterialApp(
        home: GalleryTab(images: testImages),
      ));

      // Expect that GalleryTab has been rendered
      expect(find.byType(GalleryTab), findsOneWidget);

      // Expect that the number of Image.network widgets matches the length of the testImages list
      expect(find.byType(Image), findsNWidgets(testImages.length));
    });
  });
}
