import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_request_model.dart';

void main() {
  test('toJson should convert ChatRequestModel to a valid JSON map', () {
    // Arrange
    const String address = 'arada';
    const bool isNew = true;
    const String message = 'I have headache';
    final ChatRequestModel chatRequestModel = ChatRequestModel(
      address: address,
      isNew: isNew,
      message: message,
    );

    // Act
    final Map<String, dynamic> result = chatRequestModel.toJson();

    // Assert
    expect(result, isA<Map<String, dynamic>>());
    expect(result['Address'], address);
    expect(result['isNewChat'], isNew);
    expect(result['message'], message);
  });
}
