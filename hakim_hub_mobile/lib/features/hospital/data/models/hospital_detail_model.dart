import 'package:hakim_hub_mobile/features/hospital/data/models/eductational_institution.dart';

import 'hospital_address.dart';
import 'hospital_availability.dart';
import 'hospital_doctor_model.dart';

class InstitutionDetailModel  {
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
  List<String> photos;
  List<DoctorModel> doctors;
  List<EducationalInstitute> educationalInstitutions;
  String id;
  List<String> allSpecialities;

  InstitutionDetailModel({
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

  factory InstitutionDetailModel.fromJson(Map<String, dynamic> json) {
    return InstitutionDetailModel(
      educationalInstitutions: List<EducationalInstitute>.from(
          json['allEducationalInstitutions']
              .map((x) => EducationalInstitute.fromJson(x))),
      id: json['id'],
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
      institutionAvailability: InstitutionAvailabilityModel.fromJson(
          json['institutionAvailability']),
      address: AddressModel.fromJson(json['address']),
      services: List<String>.from(json['services']),
      photos: List<String>.from(json['photos']),
      allSpecialities: List<String>.from(json['allSpecialities']),
      doctors: List<DoctorModel>.from(
          json['doctors'].map((x) => DoctorModel.fromJson(x))),
    );
  }
}
