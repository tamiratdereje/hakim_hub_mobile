import '../../domain/entities/chat_doctor_entity.dart';

// ignore: must_be_immutable
class ChatDoctorModel extends ChatDoctorEntity {
  ChatDoctorModel({
    required String fullName,
    required String photoUrl,
    required String id,
    required String speciality
  }) : super(id: id, photoUrl: photoUrl, fullName: fullName, speciality: speciality);

  factory ChatDoctorModel.fromJson(Map<String, dynamic> json) {
    return ChatDoctorModel(
      fullName: json['fullName'] ?? "",
      photoUrl: json['photoUrl'] ?? "",
      id: json['id'] ?? "",
      speciality: (json['speciality'] ?? []).length > 0 ? json['speciality'][0] : "",
    );
  }
}
