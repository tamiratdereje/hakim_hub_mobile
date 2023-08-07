import 'package:equatable/equatable.dart';

/// Domain entity representing doctor filter criteria.
class DoctorFilterDomain extends Equatable {
  /// ID of the institution to filter by.
  final String institutionId;

  /// Minimum years of experience to filter by.
  final String experienceYears;

  /// Name of educational institute to filter by.
  final String educationalName;

  /// List of specialities to filter doctors by.
  final List<String> specialities;

  /// Create a new instance with provided filter criteria.
  DoctorFilterDomain({
    required this.institutionId,
    required this.experienceYears,
    required this.educationalName,
    required this.specialities,
  });

  /// Properties to check for equality.
  @override
  List<Object?> get props =>
      [institutionId, experienceYears, educationalName, specialities];
}
