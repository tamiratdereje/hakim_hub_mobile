import 'dart:convert';
import 'dart:io';

import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_request_model.dart';
import 'package:http/http.dart' as http;

import 'package:hakim_hub_mobile/features/chatbot/data/models/chat_response_model.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';

import '../../../../core/utils/base_url.dart';

abstract class ChatRemoteDataSource {
  Future<ChatResponseModel> getResponse(ChatRequest request);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client client;
  String baseUrl = getBaseUrl();

  ChatRemoteDataSourceImpl({required this.client});
  Future<ChatResponseModel> getResponse(ChatRequest request) async {
    try {
      final chatModel = ChatRequestModel(
        address: request.address,
        isNew: request.isNew,
        message: request.message,
      );

      final jsonBody = chatModel.toJson();

      final response = await client.post(
        Uri.parse("https://hakim-hub.onrender.com/api/Chat"),
        body: json.encode(jsonBody),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      // print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body)["value"];
        return ChatResponseModel.fromJson(jsonResponse);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
