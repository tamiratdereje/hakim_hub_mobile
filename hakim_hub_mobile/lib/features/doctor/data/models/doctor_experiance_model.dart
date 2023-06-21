import 'dart:html';

class Experience {
  String title;
  String description;
  String institution;
  DateTime startDate;
  DateTime endDate;

  Experience({
    required this.title,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.description
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      title: json['position'],
      institution: json['institutionName'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      description: json['description']
    );
  }
}
