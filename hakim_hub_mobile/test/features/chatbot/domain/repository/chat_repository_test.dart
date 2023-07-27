import 'package:hakim_hub_mobile/features/chatbot/domain/repositories/chat_repository.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/usecases/get_chat_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'chat_institute_test.mocks.dart';
import 'chat_repository_test.mocks.dart';

@GenerateMocks([ChatRepository])


void main() {
  late GetChatResponse useCase;
  late MockChatRepository mockChatRepository;

  setUp(() {
    mockChatRepository = MockChatRepository();
    useCase = GetChatResponse(repository: mockChatRepository);
  });

  group('GetChatResponse', () {
    test('should get ChatResponse from repository', () async {
      // Arrange
      final chatRequest = ChatRequest(
          address: "Some Address", isNew: true, message: 'I have headache');
      final expectedChatResponse = ChatResponse(
        institutes: [MockChatInstituteEntity()],
        reply: "Some reply",
        speciality: "Some speciality",
      );

     
      when(mockChatRepository.getChatResponse(any)).thenAnswer(
        (_) async => Right(expectedChatResponse),
      );

      // Act
      final result = await useCase(chatRequest);

      // Assert
      expect(result, Right(expectedChatResponse));
      verify(mockChatRepository.getChatResponse(chatRequest)).called(1);
      verifyNoMoreInteractions(mockChatRepository);
    });


  });
}
