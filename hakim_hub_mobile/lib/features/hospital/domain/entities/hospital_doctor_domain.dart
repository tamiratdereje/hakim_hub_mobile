import 'package:equatable/equatable.dart';

/// Domain entity representing a doctor.
class DoctorDomain extends Equatable {
  /// Full name of the doctor.
  final String fullName;

  /// Short description about the doctor.
  final String about;

  /// Gender of the doctor.
  final String gender;

  /// Email address of the doctor.
  final String? email;

  /// URL of the doctor's photo.
  final String photoUrl;

  /// Number of years of experience.
  final int yearsOfExperience;

  /// ID of the main institution the doctor works at.
  final String mainInstitutionId;

  /// Name of the main institution the doctor works at.
  final String mainInstitutionName;

  /// List of the doctor's specialities.
  final List<String> specialities;

  /// Unique ID of the doctor.
  final String id;

  /// Create a new instance with the provided doctor data.
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

  /// Properties to check for equality.
  @override
  List<Object?> get props => [
        fullName,
        about,
        gender,
        email,
        photoUrl,
        yearsOfExperience,
        mainInstitutionId,
        mainInstitutionName,
        specialities,
        id,
      ];

  /// Convert to JSON.
  ///
  /// This base class returns an empty map. Subclasses should override to fully implement.
  toJson() {}
}
