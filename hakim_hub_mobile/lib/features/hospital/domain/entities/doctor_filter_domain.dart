class DoctorFilterDomain {
  String institutionId;
  String experienceYears;
  String educationalName;
  List<String> specialities;

  DoctorFilterDomain({
    required this.institutionId,
    required this.experienceYears,
    required this.educationalName,
    required this.specialities,
  });
}
