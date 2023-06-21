import 'dart:html';

class ExperienceModel {
  String title;
  String description;
  String institution;
  DateTime startDate;
  DateTime endDate;

  ExperienceModel({
    required this.title,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.description
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      title: json['position'],
      institution: json['institutionName'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      description: json['description']
    );
  }
}
