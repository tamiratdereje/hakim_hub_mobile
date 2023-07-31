import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/datasources/chat_remote_data_soure.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_request_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_response_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'chat_remote_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late ChatRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ChatRemoteDataSourceImpl(client: mockHttpClient);
  });

  // Test data for ChatRequestEntity
  final ChatRequest testChatRequest = ChatRequest(
    address: "Some Address",
    isNew: true,
    message: 'I have headache',
  );

  // Test data for ChatRequestModel
  final ChatRequestModel testChatRequestModel = ChatRequestModel(
    address: "Some Address",
    isNew: true,
    message: 'I have headache',
  );

  // Test data for JSON response
  final Map<String, dynamic> jsonResponseData = {
    "value": {
      // Add your sample data for ChatResponseModel here
    },
  };

  test(
      'getResponse should return ChatResponseModel when the request is successful',
      () async {
    // Arrange
    when(mockHttpClient.post(any,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer(
            (_) async => http.Response(json.encode(jsonResponseData), 200));

    // Act
    final result = await dataSource.getResponse(testChatRequest);

    // Assert
    expect(result, isA<ChatResponseModel>());
    // Add more assertions to validate the response data, if needed
  });

  test(
      'getResponse should throw ServerException when the response status code is not 200',
      () async {
    // Arrange
    when(mockHttpClient.post(any,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Error', 404));

    // Act
    final call =
        dataSource.getResponse; // Wrap the call in a function to pass to expect

    // Assert
    expect(() => call(testChatRequest), throwsA(isA<ServerException>()));
  });

  test(
      'getResponse should throw ServerException when an exception occurs during the request',
      () async {
    // Arrange
    when(mockHttpClient.post(any,
            body: anyNamed('body'), headers: anyNamed('headers')))
        .thenThrow(Exception());

    // Act
    final call =
        dataSource.getResponse; // Wrap the call in a function to pass to expect

    // Assert
    expect(() => call(testChatRequest), throwsA(isA<ServerException>()));
  });
}
