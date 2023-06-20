import 'hospital_address.dart';
import 'hospital_availability.dart';
import 'hospital_doctor_model.dart';

class Institution {
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
  InstitutionAvailability institutionAvailability;
  Address address;
  List<String> services;
  List<String> photos;
  List<Doctor> doctors;
  String id;

  Institution({
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

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
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
      institutionAvailability: InstitutionAvailability.fromJson(json['institutionAvailability']),
      address: Address.fromJson(json['address']),
      services: List<String>.from(json['services']),
      photos: List<String>.from(json['photos']),
      doctors: List<Doctor>.from(json['doctors'].map((x) => Doctor.fromJson(x))),
      id: json['id'],
    );
  }
}
