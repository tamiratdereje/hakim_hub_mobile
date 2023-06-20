
class InstitutionAvailabilityModel {
  int startDay;
  int endDay;
  String opening;
  String closing;
  bool twentyFourHours;
  String institutionId;
  String id;

  InstitutionAvailabilityModel({
    required this.startDay,
    required this.endDay,
    required this.opening,
    required this.closing,
    required this.twentyFourHours,
    required this.institutionId,
    required this.id,
  });

  factory InstitutionAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return InstitutionAvailabilityModel(
      startDay: json['startDay'],
      endDay: json['endDay'],
      opening: json['opening'],
      closing: json['closing'],
      twentyFourHours: json['twentyFourHours'],
      institutionId: json['institutionId'],
      id: json['id'],
    );
  }
}
