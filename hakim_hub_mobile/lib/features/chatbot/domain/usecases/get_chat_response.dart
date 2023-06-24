import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/repositories/chat_repository.dart';

class GetChatResponse {
  final ChatRepository repository;

  GetChatResponse({required this.repository});

  Future<Either<Failure, ChatResponse>> call(ChatRequest chatRequest) async {
    return await repository.getChatResponse(chatRequest);
  }
}
