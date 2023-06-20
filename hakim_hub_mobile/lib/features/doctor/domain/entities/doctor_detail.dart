import '../../data/models/doctor_education_model.dart';
import '../../data/models/doctor_experiance_model.dart';

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
    required this.educations,
    required this.email,
    required this.experiences,
    required this.gender,
    required this.id,
    required this.mainInstitutionId,
    required this.mainInstitutionName,
    required this.photoUrl,
    required this.specialities,
    required this.yearsOfExperience,
  });
}
