import 'package:equatable/equatable.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/educational_institute.dart';

import 'hospital_address_domain.dart';
import 'hospital_availability_domain.dart';
import 'hospital_doctor_domain.dart';

/// Domain entity representing detailed hospital data.
class InstitutionDetailDomain extends Equatable {
  /// Educational institutions associated with the hospital.
  List<EductationalInstitutionDomain> educationalInstitutions;

  /// Name of the hospital.
  String institutionName;

  /// Name of the hospital branch.
  String branchName;

  /// Website URL of the hospital.
  String website;

  /// Phone number of the hospital.
  String phoneNumber;

  /// Summary description of the hospital.
  String summary;

  /// Date when the hospital was established.
  DateTime establishedOn;

  /// Average rating for the hospital.
  double rate;

  /// Current status of the hospital.
  String status;

  /// URL of the hospital's logo image.
  String logoUrl;

  /// URL of the hospital's banner image.
  String bannerUrl;

  /// The hospital's availability schedule.
  InstitutionAvailabilityDomain institutionAvailability;

  /// Address of the hospital.
  AddressDomain address;

  /// List of services offered by the hospital.
  List<String> services;

  /// List of photo URLs for the hospital.
  List<String> photos;

  /// Doctors working at the hospital.
  List<DoctorDomain> doctors;

  /// Unique ID of the hospital.
  String id;

  /// All specialities available at the hospital.
  List<String> allSpecialities;

  /// Create a new instance with the provided hospital data.
  InstitutionDetailDomain({
    required this.allSpecialities,
    required this.educationalInstitutions,
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
    required this.photos,
    required this.doctors,
    required this.id,
  });

  /// Properties to check for equality.
  @override
  List<Object?> get props => [
        educationalInstitutions,
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
        photos,
        doctors,
        id,
        allSpecialities,
      ];
}
