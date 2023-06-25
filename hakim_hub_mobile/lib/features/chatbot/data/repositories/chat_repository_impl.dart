import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/datasources/chat_remote_data_soure.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  ChatRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, ChatResponse>> getChatResponse(
      ChatRequest request) async {
    try {
      final response = await remoteDataSource.getResponse(request);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
