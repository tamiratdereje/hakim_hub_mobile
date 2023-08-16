import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_doctor_domain.dart';

/// Model for filtering doctors.
class DoctorFilterModel extends DoctorFilterDomain {
  /// ID of the institution to filter by.
  String institutionId;

  /// Years of experience to filter by.
  String experienceYears;

  /// Educational institution name to filter by.
  String educationalName;

  /// List of specialities to filter by.
  List<String> specialities;

  /// Create an instance from provided data.
  DoctorFilterModel({
    required this.institutionId,
    required this.experienceYears,
    required this.educationalName,
    required this.specialities,
  }) : super(
          educationalName: educationalName,
          experienceYears: experienceYears,
          specialities: specialities,
          institutionId: institutionId,
        );

  /// Convert to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'institutionId': institutionId,
      'experienceYears': experienceYears,
      'educationalName': educationalName,
      'specialities': specialities,
    };
  }
}
