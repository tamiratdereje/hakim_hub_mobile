import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/chat_doctor_entity.dart';

class ChatInstituteEntity extends Equatable {
  String instituteName;
  List<ChatDoctorEntity> doctors;
  String instituteId;
  String logoUrl;

  ChatInstituteEntity({
    required this.doctors,
    required this.instituteName,
    required this.instituteId,
    required this.logoUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [instituteId];
}
