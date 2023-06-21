class DoctorDomain {
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

  DoctorDomain({
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
  });
}
