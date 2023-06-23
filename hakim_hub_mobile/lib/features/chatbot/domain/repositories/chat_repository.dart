import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatResponse>> getChatResponse(
      ChatRequest chatRequest);
}
