
import '../../domain/entities/hospital_availability_domain.dart';

class InstitutionAvailabilityModel extends InstitutionAvailabilityDomain {

  InstitutionAvailabilityModel({
    required String startDay,
    required String endDay,
    required String opening,
    required String closing,
    required bool twentyFourHours,
    required String id,
  }):super(
    startDay: startDay,
    endDay: endDay,
    opening: opening,
    closing: closing,
    twentyFourHours: twentyFourHours,
    id: id,
  );

  factory InstitutionAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return InstitutionAvailabilityModel(
      startDay: json['startDay'],
      endDay: json['endDay'],
      opening: json['opening'],
      closing: json['closing'],
      twentyFourHours: json['twentyFourHours'],
      id: json['id'],
    );
  }
}
