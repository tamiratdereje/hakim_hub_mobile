import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_request_entity.dart';

// ignore: must_be_immutable
class ChatRequestModel extends ChatRequest {
  ChatRequestModel({
    required String address,
    required bool isNew,
    required String message,
  }) : super(
          address: address,
          isNew: isNew,
          message: message,
        );

  Map<String, dynamic> toJson() {
    return {
      "Address": address,
      "isNewChat": isNew,
      "message": message,
    };
  }
}
