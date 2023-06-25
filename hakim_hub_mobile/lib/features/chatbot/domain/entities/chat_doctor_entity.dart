import 'package:equatable/equatable.dart';

class ChatDoctorEntity extends Equatable {
  String fullName;
  String photoUrl;
  String id;

  ChatDoctorEntity({
    required this.fullName,
    required this.photoUrl,
    required this.id,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
