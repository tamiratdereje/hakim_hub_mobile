import 'dart:convert';
import 'dart:io';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/utils/base_url.dart';
import 'package:hakim_hub_mobile/features/doctor/data/models/doctor_detail_model.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/filter_doctors_model.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_detail_model.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_doctor_model.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_doctor_by_filter.dart';
import 'package:http/http.dart' as http;

abstract class HospitalDetailRemoteDataSource {
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalID);
  Future<List<DoctorModel>> getDoctorByFilter(
      DoctorFilterModel doctorFilterModel);
}

class HospitalDetailRemoteDataSoureImpl
    implements HospitalDetailRemoteDataSource {
  final http.Client client;
  String baseUrl = getBaseUrl();
  HospitalDetailRemoteDataSoureImpl({required this.client});

  @override
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalId) async {
    try {
      print("object start");
      print(hospitalId);
      print("object end");
      final response = await client.get(
        Uri.parse(baseUrl + '/InsitutionProfile/$hospitalId'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );
      // print(response.body);
      if (response.statusCode == 200) {
        print("in and out");
        final Map<String, dynamic> json = jsonDecode(response.body)["value"];
        print(json);
        InstitutionDetailModel institutionDetailModel = InstitutionDetailModel.fromJson(json);
        print("after done");
        return institutionDetailModel;
      } else {
        print("server exception");
        throw ServerException();
      }
    } catch (e) {
      print("server exception second");
      throw ServerException();
    }
  }

  @override
  Future<List<DoctorModel>> getDoctorByFilter(
      DoctorFilterModel doctorFilterModel) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl +
            '/DoctorProfiles/filter?institutionId=${doctorFilterModel.institutionId}&experienceYears=${doctorFilterModel.experienceYears}&educationName=${doctorFilterModel.educationalName}'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> returnedDoctors =
            jsonDecode(response.body)["value"];
        List<DoctorModel> doctors =
            returnedDoctors.map((data) => DoctorModel.fromJson(data)).toList();
        return doctors;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
