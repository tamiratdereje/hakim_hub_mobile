import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/institute.dart';

class ChatResponse extends Equatable {
  String reply;
  List<InstituteEntity> institutes;
  String speciality;

  ChatResponse({
    required this.institutes,
    required this.reply,
    required this.speciality,
  });

  @override
  List<Object?> get props => [];
}
