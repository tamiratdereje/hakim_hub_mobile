class EducationalInstitute {
  String institutionName;
  String logoUrl;
  String id;

  EducationalInstitute({
    required this.institutionName,
    required this.logoUrl,
    required this.id,
  });

  factory EducationalInstitute.fromJson(Map<String, dynamic> json) {
    return EducationalInstitute(
      institutionName: json['institutionName'],
      logoUrl: json['logoUrl'],
      id: json['id'],
    );
  }
}
