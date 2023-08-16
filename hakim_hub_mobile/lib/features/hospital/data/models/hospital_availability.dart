import '../../domain/entities/hospital_availability_domain.dart';

/// Model representing a hospital's availability schedule.
class InstitutionAvailabilityModel extends InstitutionAvailabilityDomain {
  /// Index of start day of schedule (0-6).
  String startDay;

  /// Index of end day of schedule (0-6).
  String endDay;

  /// Opening time.
  String opening;

  /// Closing time.
  String closing;

  /// Whether open 24 hours.
  bool twentyFourHours;

  /// Unique ID.
  String id;

  /// Create new instance with provided data.
  InstitutionAvailabilityModel(
      {required this.startDay,
      required this.endDay,
      required this.opening,
      required this.closing,
      required this.twentyFourHours,
      required this.id})
      : super(
            startDay: startDay,
            endDay: endDay,
            opening: opening,
            closing: closing,
            twentyFourHours: twentyFourHours,
            id: id);

  /// Construct from JSON data.
  factory InstitutionAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return InstitutionAvailabilityModel(
      startDay: json['startDay'] ?? "0",
      endDay: json['endDay'] ?? "5",
      opening: json['opening'] ?? "06:30",
      closing: json['closing'] ?? "12:30",
      twentyFourHours: json['twentyFourHours'] ?? false,
      id: json['id'] ?? "id",
    );
  }

  /// Convert to JSON.
  Map<String, dynamic> toJson() {
    return {
      'startDay': startDay,
      'endDay': endDay,
      'opening': opening,
      'closing': closing,
      'twentyFourHours': twentyFourHours,
      'id': id,
    };
  }
}
