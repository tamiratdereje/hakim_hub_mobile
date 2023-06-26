import 'package:equatable/equatable.dart';

class ChatDoctorEntity extends Equatable {
  String fullName;
  String photoUrl;
  String id;
  String speciality;

  ChatDoctorEntity({
    required this.fullName,
    required this.photoUrl,
    required this.id,
    required this.speciality
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
