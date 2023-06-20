

class Education {
  String degree;
  String institution;
  DateTime startDate;
  DateTime endDate;

  Education({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'],
      institution: json['institution'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
    );
  }
}
