import 'hospital_address_domain.dart';
import 'hospital_availability_domain.dart';
import 'hospital_doctor_domain.dart';

class InstitutionDomain {
  String institutionName;
  String branchName;
  String website;
  String phoneNumber;
  String summary;
  DateTime establishedOn;
  double rate;
  bool status;
  String logoUrl;
  String bannerUrl;
  InstitutionAvailabilityDomain institutionAvailability;
  AddressDomain address;
  List<String> services;
  List<String> photos;
  List<DoctorDomain> doctors;
  String id;

  InstitutionDomain({
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

}
