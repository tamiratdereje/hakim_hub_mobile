import 'package:flutter/material.dart';

class Education {
  String degree;
  String institution;
  DateTime startDate;
  DateTime endDate;
  String fieldOfStudy;
  String logoUrl;

  Education({
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
    required this.fieldOfStudy,
    required this.logoUrl
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'],
      institution: json['educationInstitution'],
      startDate: DateTime.parse(json['startYear']),
      endDate: DateTime.parse(json['graduationYear']),
      fieldOfStudy: json['fieldOfStudy'],
    logoUrl: json['educationInstitutionLogoUrl']
      
    );
  }
}
