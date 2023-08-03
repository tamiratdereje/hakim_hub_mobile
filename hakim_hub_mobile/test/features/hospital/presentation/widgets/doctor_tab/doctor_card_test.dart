// Generate mocks for the ImageLoadBloc class
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/core/utils/colors.dart';
import 'package:hakim_hub_mobile/core/utils/pixle_to_percent.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_tab/doctor_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import 'doctor_card_test.mocks.dart';

void main() {
  
  testWidgets('renders doctor card with image', (tester) async {
    // Arrange

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DoctorCard(
            imageUrl: 'https://example.com/image.jpg',
            title: 'John Doe',
            subtitle: 'Cardiologist',
          ),
        ),
      ),
    );

    // Assert
    // final widget = tester.widget(find.byType(DoctorCard));
    expect(find.byType(CircleAvatar), findsOneWidget);
  });

  testWidgets('renders doctor card with placeholder when image is loading',
      (tester) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DoctorCard(
            imageUrl: 'https://example.com/image.jpg',
            title: 'John Doe',
            subtitle: 'Cardiologist',
          ),
        ),
      ),
    );

    // Assert
    // final widget = tester.widget(find.byType(DoctorCard));
    // expect(widget.child, hasOneWidget(Shimmer.fromColors));
    expect(
        find.byType(Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: CircleAvatar(
            backgroundColor: shimmerColor,
            radius: pixleToPercent(83, "height").w,
          ),
        ) as Type),
        findsOneWidget);
  });

  testWidgets('renders doctor card with error message when image fails to load',
      (tester) async {
    // Arrange

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DoctorCard(
            imageUrl: 'https://example.com/image.jpg',
            title: 'John Doe',
            subtitle: 'Cardiologist',
          ),
        ),
      ),
    );

    // Assert
    // final widget = tester.widget(find.byType(DoctorCard));
    // expect(widget.child, hasOneWidget(Text));
    expect(find.text(''), '');
  });
}
