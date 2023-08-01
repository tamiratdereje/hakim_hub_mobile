import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_doctor_model.dart';

void main() {
  // Test data for JSON
  final Map<String, dynamic> jsonData = {
    'fullName': 'John Doe',
    'photoUrl': 'https://hakimhub.com/photo.png',
    'id': '12345',
    'specialities': ["Neurologiest"],
  };

  test('fromJson should create a valid ChatDoctorModel object', () {
    // Arrange
    const String fullName = 'John Doe';
    const String photoUrl = 'https://hakimhub.com/photo.png';
    const String id = '12345';
    const String speciality = 'Neurologiest';

    // Act
    final result = ChatDoctorModel.fromJson(jsonData);

    // Assert
    expect(result, isA<ChatDoctorModel>());
    expect(result.fullName, fullName);
    expect(result.photoUrl, photoUrl);
    expect(result.id, id);
    expect(result.speciality, speciality);
  });

  test('fromJson should create a ChatDoctorModel object with empty speciality when "specialities" is empty', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithEmptySpecialities = {
      'fullName': 'John Doe',
      'photoUrl': 'https://hakimhub.com/photo.png',
      'id': '12345',
      'specialities': [],
    };

    // Act
    final result = ChatDoctorModel.fromJson(jsonDataWithEmptySpecialities);

    // Assert
    expect(result, isA<ChatDoctorModel>());
    expect(result.speciality, "");
  });

  test('fromJson should create a ChatDoctorModel object with empty speciality when "specialities" is null', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithoutSpecialities = {
      'fullName': 'John Doe',
      'photoUrl': 'https://hakimhub.com/photo.png',
      'id': '12345',
      'specialities': null,
    };

    // Act
    final result = ChatDoctorModel.fromJson(jsonDataWithoutSpecialities);

    // Assert
    expect(result, isA<ChatDoctorModel>());
    expect(result.speciality, "");
  });
}
