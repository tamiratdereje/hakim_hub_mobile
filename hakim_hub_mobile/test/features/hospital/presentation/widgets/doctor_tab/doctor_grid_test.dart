import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/bloc/search_doctors_bloc/search_doctors_bloc.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_tab/doctor_card.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/doctor_tab/doctor_grid_view.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([SearchBarBloc])
void main() {
  // group('DoctorGridView', () {
  //   testWidgets('displays the correct number of doctors',
  //       (WidgetTester tester) async {
  //     final SearchBarBloc mockSearchBarBloc = MockSearchBarBloc();

  //     when(mockSearchBarBloc.state)
  //         .thenReturn(SearchBarLoadedState(filteredDoctors: [
  //       DoctorDomain(
  //           id: '1',
  //           fullName: 'Dr. John Doe',
  //           photoUrl: 'http://example.com/image.jpg',
  //           specialities: ['Cardiologist']),
  //       DoctorDomain(
  //           id: '2',
  //           fullName: 'Dr. Jane Doe',
  //           photoUrl: 'http://example.com/image.jpg',
  //           specialities: ['Neurologist']),
  //     ]));

  //     await tester.pumpWidget(
  //       BlocProvider.value(
  //         value: mockSearchBarBloc,
  //         child: MaterialApp(
  //           home: DoctorGridView(
  //             doctors: [],
  //             filterList: [],
  //             onFilterChanged: (_) {},
  //             institutionId: '1',
  //           ),
  //         ),
  //       ),
  //     );

  //     await tester.pumpAndSettle();

  //     expect(find.byType(DoctorCard), findsNWidgets(2));
  //   });
  // });
}
