import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_response_entity.dart';

import 'chat_institute_model.dart';

class ChatResponseModel extends ChatResponse {
  ChatResponseModel({
    required String reply,
    required String speciality,
    required List<ChatInsituteModel> institutes,
  }) : super(
          institutes: institutes,
          reply: reply,
          speciality: speciality,
        );
  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> instituesList = json['institues'];
    List<ChatInsituteModel> institutes =
        instituesList.map((e) => ChatInsituteModel.fromJson(e)).toList();

    return ChatResponseModel(
      reply: json['reply'],
      speciality: json['speciality'],
      institutes: institutes,
    );
  }
}
