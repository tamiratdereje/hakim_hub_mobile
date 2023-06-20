
class DoctorModel {
  String fullName;
  String about;
  String gender;
  String? email;
  String photoUrl;
  int yearsOfExperience;
  String mainInstitutionId;
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
    required this.specialities,
    required this.id,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      fullName: json['fullName'],
      about: json['about'],
      gender: json['gender'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      yearsOfExperience: json['yearsOfExperience'],
      mainInstitutionId: json['mainInstitutionId'],
      specialities: List<String>.from(json['specialities']),
      id: json['id'],
    );
  }
}