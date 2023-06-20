import 'hospital_address_domain.dart';
import 'hospital_availability_domain.dart';

class InstitutionSearchDomain {
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
  String id;

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
}
