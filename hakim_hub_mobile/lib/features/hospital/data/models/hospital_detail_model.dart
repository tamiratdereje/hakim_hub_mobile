import 'package:hakim_hub_mobile/features/hospital/data/models/eductational_institution.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'hospital_address.dart';
import 'hospital_availability.dart';
import 'hospital_doctor_model.dart';

class InstitutionDetailModel extends InstitutionDetailDomain {
  InstitutionDetailModel({
    required String institutionName,
    required String branchName,
    required String website,
    required String phoneNumber,
    required String summary,
    required DateTime establishedOn,
    required double rate,
    required bool status,
    required String logoUrl,
    required String bannerUrl,
    required InstitutionAvailabilityModel institutionAvailability,
    required AddressModel address,
    required List<String> services,
    required List<String> photos,
    required List<DoctorModel> doctors,
    required List<EducationInstituteModel> educationalInstitutions,
    required String id,
    required List<String> allSpecialities,
  }) : super(
          educationalInstitutions: educationalInstitutions,
          allSpecialities: allSpecialities,
          institutionName: institutionName,
          branchName: branchName,
          website: website,
          phoneNumber: phoneNumber,
          summary: summary,
          establishedOn: establishedOn,
          rate: rate,
          status: status,
          logoUrl: logoUrl,
          bannerUrl: bannerUrl,
          institutionAvailability: institutionAvailability,
          address: address,
          services: services,
          photos: photos,
          doctors: doctors,
          id: id,
        );

  factory InstitutionDetailModel.fromJson(Map<String, dynamic> json) {
    return InstitutionDetailModel(
      educationalInstitutions: List<EducationInstituteModel>.from(
          json['allEducationalInstitutions']
              .map((x) => EducationInstituteModel.fromJson(x))),
      allSpecialities: List<String>.from(json['allSpecialities']),
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
      doctors: List<DoctorModel>.from(
          json['doctors'].map((x) => DoctorModel.fromJson(x))),
    );
  }
}
