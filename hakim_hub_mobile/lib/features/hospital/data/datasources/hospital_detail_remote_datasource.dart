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

/// Hospital detail remote data source.
///
/// Contains methods for retrieving hospital and doctor data from a remote API.
abstract class HospitalDetailRemoteDataSource {
  /// Gets the detail information for a hospital.
  ///
  /// Fetches the hospital data from the `/InsitutionProfile/{id}` endpoint.
  /// Throws a [ServerException] for all error codes.
  ///
  /// Parameters:
  ///   hospitalId: The ID of the hospital to get details for.
  /// Returns: The [InstitutionDetailModel] for the hospital.
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalId);

  /// Gets doctors filtered by the provided criteria.
  ///
  /// Calls the `/DoctorProfiles/filter` endpoint to find doctors.
  /// Throws a [ServerException] for any errors.
  ///
  /// Parameters:
  ///   doctorFilterModel: The filter criteria to find doctors by.
  /// Returns: A list of [DoctorModel] matching the filter.
  Future<List<DoctorModel>> getDoctorByFilter(
      DoctorFilterModel doctorFilterModel);
}

/// Implementation of [HospitalDetailRemoteDataSource] that uses an HTTP client.
class HospitalDetailRemoteDataSoureImpl
    implements HospitalDetailRemoteDataSource {
  /// The HTTP client for making requests.
  final http.Client client;

  /// Base API URL.
  String baseUrl = getBaseUrl();

  /// Creates an instance with the provided [client].
  HospitalDetailRemoteDataSoureImpl({required this.client});

  @override
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalId) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + '/InsitutionProfile/$hospitalId'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = response.body;

        if (responseBody.isNotEmpty) {
          final Map<String, dynamic> json = jsonDecode(responseBody)["value"];

          return InstitutionDetailModel.fromJson(json);
        } else {
          throw ServerException();
        }
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<DoctorModel>> getDoctorByFilter(
      DoctorFilterModel doctorFilterModel) async {
    try {
      final response = await client.post(
        Uri.parse(baseUrl +
            '/DoctorProfiles/filter?institutionId=${doctorFilterModel.institutionId}&experienceYears=${-1}&educationName='),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(doctorFilterModel.specialities),
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
