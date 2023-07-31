import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/chatbot/presentation/bloc/chat_bot_bloc.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/usecases/get_chat_response.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'chatbot-bloc-test.mocks.dart';

// Mock the GetChatResponse use case
@GenerateMocks([GetChatResponse])
void main() {
  group('ChatBotBloc', () {
    late ChatBotBloc chatBotBloc;
    late MockGetChatResponse mockGetChatResponse;

    setUp(() {
      mockGetChatResponse = MockGetChatResponse();
      chatBotBloc = ChatBotBloc(getChatResponse: mockGetChatResponse);
    });

    test('initial state should be ChatBotInitialState', () {
      expect(chatBotBloc.state, equals(ChatBotInitialState()));
    });

    test(
        'emits ChatBotLoadingState and ChatBotSuccessState on successful response',
        () {
      // Mock the response you expect from the use case
      final mockResponse = ChatResponse(
          reply: "Hello! How can I assist you?",
          institutes: [],
          speciality: "");

      // Simulate the response of the use case
      when(mockGetChatResponse(any))
          .thenAnswer((_) async => Right(mockResponse));

      // Dispatch the event to the bloc
      chatBotBloc.add(GetChatResponseEvent(
          request: ChatRequest(message: "Hi", address: "", isNew: true)));

      // Expect the correct states to be emitted
      expectLater(
        chatBotBloc.stream,
        emitsInOrder([
          ChatBotLoadingState(),
          ChatBotSuccessState(chatResponse: mockResponse),
        ]),
      );
    });

    test('emits ChatBotLoadingState and ChatBotFailureState on error', () {
      // Mock the error response from the use case
      final mockError = ServerFailure();

      // Simulate the error response of the use case
      when(mockGetChatResponse(any)).thenAnswer((_) async => Left(mockError));

      // Dispatch the event to the bloc
      chatBotBloc.add(GetChatResponseEvent(
          request: ChatRequest(message: "Error", isNew: true, address: "")));

      // Expect the correct states to be emitted
      expectLater(
        chatBotBloc.stream,
        emitsInOrder([
          ChatBotLoadingState(),
          ChatBotFailureState(error: mockError),
        ]),
      );
    });

    test('emits ChatBotInitialState when SetIntialStateEvent is added', () {
      chatBotBloc.add(SetIntialStateEvent());
      expectLater(chatBotBloc.stream, emitsInOrder([ChatBotInitialState()]));
    });

    tearDown(() {
      chatBotBloc.close();
    });
  });
}
