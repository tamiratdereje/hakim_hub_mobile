import 'package:equatable/equatable.dart';

/// Domain entity representing an educational institution.
class EductationalInstitutionDomain extends Equatable {
  /// Name of the educational institution.
  final String institutionName;

  /// URL of the institution's logo image.
  final String logoUrl;

  /// Unique identifier for the institution.
  final String id;

  /// Create a new instance with the provided data.
  EductationalInstitutionDomain({
    required this.institutionName,
    required this.logoUrl,
    required this.id,
  });

  /// List of properties to check for equality.
  @override
  List<Object?> get props => [institutionName, logoUrl, id];

  /// Convert object to JSON.
  ///
  /// This base class returns an empty map. Subclasses should override to fully implement.
  toJson() {}
}
