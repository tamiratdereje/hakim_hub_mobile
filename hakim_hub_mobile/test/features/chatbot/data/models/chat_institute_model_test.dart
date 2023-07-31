import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_doctor_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_institute_model.dart';

void main() {
  
  final Map<String, dynamic> doctorData1 = {
    'fullName': 'Dr. John Doe',
    'photoUrl': 'https://example.com/doctor1.png',
    'id': 'doctor123',
    'specialities': ['Pediatrics'],
  };

  final Map<String, dynamic> doctorData2 = {
    'fullName': 'Dr. Jane Smith',
    'photoUrl': 'https://example.com/doctor2.png',
    'id': 'doctor456',
    'specialities': ['Cardiology'],
  };

  // Test data for JSON
  final Map<String, dynamic> jsonData = {
    'institutionName': 'Tikur Anbesa',
    'id': '123456',
    'logoUrl': 'https://example.com/logo.png',
    'doctors': [doctorData1, doctorData2]
  };

  test('fromJson should create a valid ChatInsituteModel object', () {
    // Arrange
    final List<ChatDoctorModel> expectedDoctors = [
      ChatDoctorModel.fromJson(doctorData1), 
      ChatDoctorModel.fromJson(doctorData2),
    ];

    // Act
    final result = ChatInsituteModel.fromJson(jsonData);

    // Assert
    expect(result, isA<ChatInsituteModel>());
    expect(result.instituteName, 'Tikur Anbesa');
    expect(result.instituteId, '123456');
    expect(result.logoUrl, 'https://example.com/logo.png');
    expect(result.doctors, expectedDoctors); 
  });

  test('fromJson should create a ChatInsituteModel object with empty doctors list when "doctors" is null', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithoutDoctors = {
      'institutionName': 'Tikur Anbesa',
      'id': '123456',
      'logoUrl': 'https://example.com/logo.png',
      'doctors': null,
    };

    // Act
    final result = ChatInsituteModel.fromJson(jsonDataWithoutDoctors);

    // Assert
    expect(result, isA<ChatInsituteModel>());
    expect(result.instituteName, 'Tikur Anbesa');
    expect(result.instituteId, '123456');
    expect(result.logoUrl, 'https://example.com/logo.png');
    expect(result.doctors, []);
  });

  test('fromJson should create a ChatInsituteModel object with empty doctors list when "doctors" is empty', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithEmptyDoctors = {
      'institutionName': 'Tikur Anbesa',
      'id': '123456',
      'logoUrl': 'https://example.com/logo.png',
      'doctors': [],
    };

    // Act
    final result = ChatInsituteModel.fromJson(jsonDataWithEmptyDoctors);

    // Assert
    expect(result, isA<ChatInsituteModel>());
    expect(result.instituteName, 'Tikur Anbesa');
    expect(result.instituteId, '123456');
    expect(result.logoUrl, 'https://example.com/logo.png');
    expect(result.doctors, []);
  });
}
