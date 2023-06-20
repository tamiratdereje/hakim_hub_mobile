


class InstitutionAvailability {
  int startDay;
  int endDay;
  String opening;
  String closing;
  bool twentyFourHours;
  String institutionId;
  String id;

  InstitutionAvailability({
    required this.startDay,
    required this.endDay,
    required this.opening,
    required this.closing,
    required this.twentyFourHours,
    required this.institutionId,
    required this.id,
  });

  factory InstitutionAvailability.fromJson(Map<String, dynamic> json) {
    return InstitutionAvailability(
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