import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_doctor_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_institute_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_response_model.dart';

void main() {
  
  final Map<String, dynamic> doctorData1 = {
    'fullName': 'Dr. John Doe',
    'photoUrl': 'https://hakimhub.com/doctor1.png',
    'id': 'doctor123',
    'speciality': 'Pediatrics'
  };

  final Map<String, dynamic> doctorData2 = {
    'fullName': 'Dr. Jane Smith',
    'photoUrl': 'https://hakimhub.com/doctor2.png',
    'id': 'doctor456',
    'speciality': 'Cardiology'
  };

  final Map<String, dynamic> instituteData1 = {
    'institutionName': 'Institute A',
    'id': 'institute123',
    'logoUrl': 'https://hakimhub.com/institute1.png',
    'doctors': [doctorData1]
  };

  final Map<String, dynamic> instituteData2 = {
    'institutionName': 'Institute B',
    'id': 'institute456',
    'logoUrl': 'https://hakimhub.com/institute2.png',
    'doctors': [doctorData2]
  };

  // Test data for JSON
  final Map<String, dynamic> jsonData = {
    'reply': 'I'm sorry to hear that. Could you please tell me about any other symptoms you may have experienced?',
    'speciality': 'Neurologist',
    'institutions': [instituteData1, instituteData2],
  };

  test('fromJson should create a valid ChatResponseModel object', () {
    // Arrange
    const String reply = 'I'm sorry to hear that. Could you please tell me about any other symptoms you may have experienced?';
    const String speciality = 'Neurologist';

    // Add sample data for ChatInsituteModel here
    final List<ChatInsituteModel> expectedInstitutes = [
      ChatInsituteModel.fromJson(instituteData1), 
      ChatInsituteModel.fromJson(instituteData2),
    ];

    // Act
    final ChatResponseModel result = ChatResponseModel.fromJson(jsonData);

    // Assert
    expect(result, isA<ChatResponseModel>());
    expect(result.reply, reply);
    expect(result.speciality, speciality);
    expect(result.institutes, expectedInstitutes);
  });

  test('fromJson should create a ChatResponseModel object with empty institutes list when "institutions" is null', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithoutInstitutes = {
      'reply': 'I'm sorry to hear that. Could you please tell me about any other symptoms you may have experienced?',
      'speciality': 'Neurologist',
      'institutions': null,
    };

    // Act
    final ChatResponseModel result = ChatResponseModel.fromJson(jsonDataWithoutInstitutes);

    // Assert
    expect(result, isA<ChatResponseModel>());
    expect(result.institutes, []);
  });

  test('fromJson should create a ChatResponseModel object with empty institutes list when "institutions" is empty', () {
    // Arrange
    final Map<String, dynamic> jsonDataWithEmptyInstitutes = {
      'reply': 'I'm sorry to hear that. Could you please tell me about any other symptoms you may have experienced?',
      'speciality': 'Neurologist',
      'institutions': [],
    };

    // Act
    final ChatResponseModel result = ChatResponseModel.fromJson(jsonDataWithEmptyInstitutes);

    // Assert
    expect(result, isA<ChatResponseModel>());
    expect(result.institutes, []);
  });
}
