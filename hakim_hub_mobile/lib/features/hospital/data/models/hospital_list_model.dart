import 'hospital_address.dart';
import 'hospital_availability.dart';

class InstitutionList {
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
  InstitutionAvailabilityModel institutionAvailability;
  AddressModel address;
  List<String> services;
  String id;

  InstitutionList({
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

  factory InstitutionList.fromJson(Map<String, dynamic> json) {
    return InstitutionList(
      institutionName: json['institutionName'],
      branchName: json['branchName'],
      website: json['website'],
      phoneNumber: json['phoneNumber'],
      summary: json['summary'],
      establishedOn: DateTime.parse(json['establishedOn']),
      rate: json['rate'].toDouble(),
      status: json['status'],
      logoUrl: json['logoUrl'],
      bannerUrl: json['bannerUrl'],
      institutionAvailability: InstitutionAvailabilityModel.fromJson(json['institutionAvailability']),
      address: AddressModel.fromJson(json['address']),
      services: List<String>.from(json['services']),
      id: json['id'],
    );
  }
}
