import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_detail.dart';

import 'doctor_education_model.dart';
import 'doctor_experiance_model.dart';

class DoctorDetailModel extends DoctorDetail {
  DoctorDetailModel({
    required String fullName,
    required String about,
    required String gender,
    required String email,
    required String photoUrl,
    required int yearsOfExperience,
    required String mainInstitutionId,
    required String mainInstitutionName,
    required List<String> specialities,
    required List<Education> educations,
    required List<Experience> experiences,
    required String id,
  }) : super(
          fullName: fullName,
          about: about,
          gender: gender,
          email: email,
          photoUrl: photoUrl,
          yearsOfExperience: yearsOfExperience,
          mainInstitutionId: mainInstitutionId,
          mainInstitutionName: mainInstitutionName,
          specialities: specialities,
          educations: educations,
          experiences: experiences,
          id: id,
        );

  factory DoctorDetailModel.fromJson(Map<String, dynamic> json) {
    return DoctorDetailModel(
      fullName: json['fullName'],
      about: json['about'],
      gender: json['gender'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      yearsOfExperience: json['yearsOfExperience'],
      mainInstitutionId: json['mainInstitutionId'],
      mainInstitutionName: json['mainInstitutionName'],
      specialities: List<String>.from(json['specialities']),
      educations: (json['educations'] as List<dynamic>)
          .map((e) => Education.fromJson(e))
          .toList(),
      experiences: (json['experiences'] as List<dynamic>)
          .map((e) => Experience.fromJson(e))
          .toList(),
      id: json['id'],
    );
  }
}