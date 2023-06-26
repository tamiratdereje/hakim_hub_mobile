import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_institute_entity.dart';

import 'chat_doctor_model.dart';

class ChatInsituteModel extends ChatInstituteEntity {
  ChatInsituteModel({
    required String instituteName,
    required String instituteId,
    required String logoUrl,
    required List<ChatDoctorModel> doctors,
  }) : super(
          doctors: doctors,
          instituteId: instituteId,
          instituteName: instituteName,
          logoUrl: logoUrl,
        );

  factory ChatInsituteModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> chatDoctorsJson = json['doctors'];
    List<ChatDoctorModel> chatDoctors =
        chatDoctorsJson.map((e) => ChatDoctorModel.fromJson(e)).toList();

    return ChatInsituteModel(
      instituteName: json['instituteName'],
      instituteId: json['instituteId'],
      logoUrl: json['logoUrl'],
      doctors: chatDoctors,
    );
  }
}
