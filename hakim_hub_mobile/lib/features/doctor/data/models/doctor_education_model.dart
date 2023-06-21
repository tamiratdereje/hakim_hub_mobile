import 'package:flutter/material.dart';

class EducationModel {
  String degree;
  String institution;
  DateTime startDate;
  DateTime endDate;
  String fieldOfStudy;
  String logoUrl;

  EducationModel({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.fieldOfStudy,
    required this.logoUrl
  });

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      degree: json['degree'],
      institution: json['educationInstitution'],
      startDate: DateTime.parse(json['startYear']),
      endDate: DateTime.parse(json['graduationYear']),
      fieldOfStudy: json['fieldOfStudy'],
    logoUrl: json['educationInstitutionLogoUrl']
      
    );
  }
}
