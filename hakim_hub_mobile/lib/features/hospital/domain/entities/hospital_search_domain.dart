import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_address_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_availability_domain.dart';

/// Domain entity representing summary hospital data.
class InstitutionSearchDomain extends Equatable {
  /// Name of the hospital.
  final String institutionName;

  /// Name of the hospital branch.
  final String branchName;

  /// Website URL of the hospital.
  final String website;

  /// Phone number of the hospital.
  final String phoneNumber;

  /// Summary description of the hospital.
  final String summary;

  /// Date when the hospital was established.
  final DateTime establishedOn;

  /// Average rating for the hospital.
  final double rate;

  /// Current status of the hospital.
  final String status;

  /// URL of the hospital's logo image.
  final String logoUrl;

  /// URL of the hospital's banner image.
  final String bannerUrl;

  /// The hospital's availability schedule.
  final InstitutionAvailabilityDomain institutionAvailability;

  /// Address of the hospital.
  final AddressDomain address;

  /// List of services offered by the hospital.
  final List<String> services;

  /// Unique ID of the hospital.
  final String id;

  /// Create a new instance with the provided hospital data.
  InstitutionSearchDomain({
    required this.institutionName,
    required this.branchName,
    required this.website,
    required this.phoneNumber,
    required this.summary,
    required this.establishedOn,
    required this.rate,
    required this.status,
    required this.logoUrl,
    required this.bannerUrl,
    required this.institutionAvailability,
    required this.address,
    required this.services,
    required this.id,
  });

  /// Properties to check for equality.
  @override
  List<Object?> get props => [
        institutionName,
        branchName,
        website,
        phoneNumber,
        summary,
        establishedOn,
        rate,
        status,
        logoUrl,
        bannerUrl,
        institutionAvailability,
        address,
        services,
        id,
      ];
}
