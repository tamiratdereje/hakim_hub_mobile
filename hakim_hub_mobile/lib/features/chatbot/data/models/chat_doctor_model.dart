import '../../domain/entities/chat_doctor_entity.dart';

// ignore: must_be_immutable
class ChatDoctorModel extends ChatDoctorEntity {
  ChatDoctorModel({
    required String fullName,
    required String photoUrl,
    required String id,
  }) : super(id: id, photoUrl: photoUrl, fullName: fullName);

  factory ChatDoctorModel.fromJson(Map<String, dynamic> json) {
    return ChatDoctorModel(
      fullName: json['fullName'],
      photoUrl: json['photoUrl'],
      id: json['id'],
    );
  }
}
