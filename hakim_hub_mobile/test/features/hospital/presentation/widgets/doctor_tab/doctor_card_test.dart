// Generate mocks for the ImageLoadBloc class
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/image_bloc/image_state.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_tab/doctor_card.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'doctor_card_test.mocks.dart';

@GenerateMocks([ImageLoadBloc])
void main() {
  group('DoctorCard', () {
    testWidgets('displays the correct doctor name and specialization',
        (WidgetTester tester) async {
      final ImageLoadBloc mockImageLoadBloc = MockImageLoadBloc();

      when(mockImageLoadBloc.state).thenReturn(ImageLoadedState());

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          BlocProvider.value(
            value: mockImageLoadBloc,
            child: MaterialApp(
              home: DoctorCard(
                imageUrl: 'http://example.com/image.jpg',
                title: 'Dr. John Doe',
                subtitle: 'Cardiologist',
              ),
            ),
          ),
        );

        expect(find.text('Dr. John Doe'), findsOneWidget);
        expect(find.text('Cardiologist'), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
      });
    });
  });
}
