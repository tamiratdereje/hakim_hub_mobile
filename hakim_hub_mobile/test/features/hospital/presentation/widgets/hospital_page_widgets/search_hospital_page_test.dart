import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_page_widgets/hospital_text_field.dart';
import 'package:hakim_hub_mobile/features/hospital/presentation/widgets/hospital_page_widgets/search_hospitals_widget.dart';



void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SearchHospitalsWidget', () {
    testWidgets('calls onChanged when text field changes',
        (WidgetTester tester) async {

      await tester.pumpWidget(MaterialApp(
        home: SearchHospitalsWidget(
          serviceList: ['Service 1', 'Service 2'],
          onChanged: (){},
          onFilterChanged: () {},
        ),
      ));

      await tester.enterText(find.byType(HospitalSearchField), 'Test Hospital');
      verify(mockOnChanged.call('Test Hospital')).called(1);
    });

    // testWidgets('calls onFilterChanged when filter changes', (WidgetTester tester) async {
    //   final mockOnChanged = MockFunction();
    //   final mockOnFilterChanged = MockFunction();
    //   // Assuming the HospitalSearchField calls onFilterChanged with the selected filter value
    //   // when the filter changes. Update this test to match the actual behaviour.

    //   await tester.pumpWidget(MaterialApp(
    //     home: SearchHospitalsWidget(
    //       serviceList: ['Service 1', 'Service 2'],
    //       onChanged: mockOnChanged,
    //       onFilterChanged: mockOnFilterChanged,
    //     ),
    //   ));

    //   // Replace the following line with the actual actions needed to change the filter.
    //   // Without the implementation of HospitalSearchField, it's not clear what this would be.
    //   //await tester.tap(find.byIcon(Icons.filter_list));

    //   verify(mockOnFilterChanged.call(any)).called(1);
    // });
  });
}
