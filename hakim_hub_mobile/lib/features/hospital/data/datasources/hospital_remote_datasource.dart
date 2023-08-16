import 'dart:convert';
import 'dart:io';

import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/utils/base_url.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/filter_hospital_model.dart';
import 'package:http/http.dart' as http;

import '../models/hospital_search_model.dart';

/// Remote data source for searching hospitals.
///
/// Provides methods for searching for hospitals by different criteria.
abstract class HospitalSearchRemoteDataSource {
  /// Searches for hospitals matching the filter criteria.
  ///
  /// Calls the `/InsitutionProfile/search-institutions` endpoint to find hospitals.
  /// Throws a [ServerException] on any error.
  ///
  /// Parameters:
  ///   filterHospitalModel: Filter criteria to search by.
  /// Returns: List of [InstitutionSearchModel] matching the filter.
  Future<List<InstitutionSearchModel>> searchByFilterHospitals(
      FilterHospitalModel filterHospitalModel);

  /// Searches hospitals by name.
  ///
  /// Calls `/InsitutionProfile/search-by-name` to find hospitals.
  /// Throws a [ServerException] on any error.
  ///
  /// Parameters:
  ///   name: Name to search hospitals by.
  /// Returns: List of [InstitutionSearchModel] matching the name.
  Future<List<InstitutionSearchModel>> searchByNameHospitals(String name);

  /// Gets all hospitals.
  ///
  /// Calls `/InsitutionProfile` to retrieve all hospitals.
  /// Throws a [ServerException] on any error.
  ///
  /// Returns: List of all [InstitutionSearchModel] hospitals.
  Future<List<InstitutionSearchModel>> getAllHospitals();
}

/// Implementation of [HospitalSearchRemoteDataSource] using HTTP client.
class HospitalSearchRemoteDataSourceImpl
    implements HospitalSearchRemoteDataSource {
  /// HTTP client for making requests.
  final http.Client client;

  /// Base API URL.
  String baseUrl = getBaseUrl();

  /// Creates an instance with the provided HTTP [client].
  HospitalSearchRemoteDataSourceImpl({required this.client});

  @override
  Future<List<InstitutionSearchModel>> searchByFilterHospitals(
      FilterHospitalModel filterHospitalModel) async {
    try {
      final response = await client.post(
        Uri.parse(baseUrl +
            '/InsitutionProfile/search-institutions?operationYears=${filterHospitalModel.operationYears}&openStatus=${filterHospitalModel.openStatus}'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(filterHospitalModel.services),
      );

      if (response.statusCode == 200) {
        List<dynamic> returned = json.decode(response.body)["value"];

        List<InstitutionSearchModel> hospitals = returned
            .map((data) => InstitutionSearchModel.fromJson(data))
            .toList();
        return hospitals;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<InstitutionSearchModel>> searchByNameHospitals(
      String name) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + '/InsitutionProfile/search-by-name?Name=$name'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> returned = json.decode(response.body)["value"];

        List<InstitutionSearchModel> hospitals = returned
            .map((data) => InstitutionSearchModel.fromJson(data))
            .toList();
        return hospitals;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<InstitutionSearchModel>> getAllHospitals() async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + '/InsitutionProfile'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> returned = json.decode(response.body)["value"];

        List<InstitutionSearchModel> hospitals = returned
            .map((data) => InstitutionSearchModel.fromJson(data))
            .toList();
        return hospitals;
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
