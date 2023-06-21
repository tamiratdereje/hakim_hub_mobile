import 'dart:convert';
import 'dart:io';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/utils/base_url.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class HospitalDetailRemoteDataSource {
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalID);
}

class HospitalDetailRemoteDataSoureImpl
    implements HospitalDetailRemoteDataSource {
  final http.Client client;
  String baseUrl = getBaseUrl();
  HospitalDetailRemoteDataSoureImpl({required this.client});

  @override
  Future<InstitutionDetailModel> getHospitalDetail(String hospitalId) async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl + '/api/InsitutionProfile/$hospitalId'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body)["value"];
        return InstitutionDetailModel.fromJson(json);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
