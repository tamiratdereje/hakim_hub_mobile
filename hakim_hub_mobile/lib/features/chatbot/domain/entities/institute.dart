import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/chatbot/domain/entities/doctor_entity.dart';

class InstituteEntity extends Equatable {
  String instituteName;
  List<DoctorEntity> doctors;
  String instituteId;
  String logoUrl;

  InstituteEntity({
    required this.doctors,
    required this.instituteName,
    required this.instituteId,
    required this.logoUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [instituteId];
}
