import 'package:hakim_hub_mobile/features/hospital/domain/entities/educational_institute.dart';

/// Model representing an educational institution.
class EducationInstituteModel extends EductationalInstitutionDomain {
  /// Name of the educational institution.
  String institutionName;

  /// URL of the institution's logo.
  String logoUrl;

  /// Unique ID for the institution.
  String id;

  /// Create an instance from the provided data.
  EducationInstituteModel({
    required this.institutionName,
    required this.logoUrl,
    required this.id,
  }) : super(id: id, institutionName: institutionName, logoUrl: logoUrl);

  /// Construct an instance from a JSON map.
  factory EducationInstituteModel.fromJson(Map<String, dynamic> json) {
    return EducationInstituteModel(
      institutionName: json['institutionName'] ?? " ",
      logoUrl: json['logoUrl'] ?? " ",
      id: json['id'] ?? " ",
    );
  }

  /// Convert an instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'institutionName': institutionName,
      'logoUrl': logoUrl,
      'id': id,
    };
  }
}
