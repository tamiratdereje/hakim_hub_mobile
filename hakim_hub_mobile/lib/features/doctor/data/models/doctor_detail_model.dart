
import 'doctor_education_model.dart';
import 'doctor_experiance_model.dart';

class DoctorDetail {
  String fullName;
  String about;
  String gender;
  String email;
  String photoUrl;
  int yearsOfExperience;
  String mainInstitutionId;
  String mainInstitutionName;
  List<String> specialities;
  List<Education> educations;
  List<Experience> experiences;
  String id;

  DoctorDetail({
    required this.fullName,
    required this.about,
    required this.gender,
    required this.email,
    required this.photoUrl,
    required this.yearsOfExperience,
    required this.mainInstitutionId,
    required this.mainInstitutionName,
    required this.specialities,
    required this.educations,
    required this.experiences,
    required this.id,
  });

  factory DoctorDetail.fromJson(Map<String, dynamic> json) {
    return DoctorDetail(
      fullName: json['fullName'],
      about: json['about'],
      gender: json['gender'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      yearsOfExperience: json['yearsOfExperience'],
      mainInstitutionId: json['mainInstitutionId'],
      mainInstitutionName: json['mainInstitutionName'],
      specialities: List<String>.from(json['specialities']),
      educations: (json['educations'] as List<dynamic>).map((e) => Education.fromJson(e)).toList(),
      experiences: (json['experiences'] as List<dynamic>).map((e) => Experience.fromJson(e)).toList(),
      id: json['id'],
    );
  }
}

