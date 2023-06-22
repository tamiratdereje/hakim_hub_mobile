import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';

class DoctorModel extends DoctorDomain {
  String fullName;
  String about;
  String gender;
  String? email;
  String photoUrl;
  int yearsOfExperience;
  String mainInstitutionId;
  String mainInstitutionName;
  List<String> specialities;
  String id;

  DoctorModel({
    required this.fullName,
    required this.about,
    required this.gender,
    required this.email,
    required this.photoUrl,
    required this.yearsOfExperience,
    required this.mainInstitutionId,
    required this.mainInstitutionName,
    required this.specialities,
    required this.id,
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
          id: id,
        );

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      fullName: json['fullName'] ?? 'No Doctor Name',
      about: json['about'] ?? '',
      gender: json['gender'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'] ?? 'assets/images/doctor_image.png',
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      mainInstitutionId: json['mainInstitutionId'] ?? '',
      mainInstitutionName: json['mainInstitutionName'] ?? '',
      specialities: List<String>.from(
        json['specialities'] ?? ['No speciality'],
      ),
      id: json['id'] ?? '',
    );
  }
}
