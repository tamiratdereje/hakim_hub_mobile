import 'dart:convert';

import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/features/doctor/data/models/doctor_detail_model.dart';
import 'package:http/http.dart' as http;

abstract class DoctorDetailRemoteDataSource {
  Future<DoctorDetailModel> getDoctorDetail(String id);
}

class DoctorDetailRemoteDataSourceImpl implements DoctorDetailRemoteDataSource {
  final http.Client client;
  final uriString = '';

  DoctorDetailRemoteDataSourceImpl({required this.client});

  Future<DoctorDetailModel> getDoctorDetail(String id) async {
    final response = await client.get(
      Uri.parse('$uriString$id'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DoctorDetailModel.fromJson(jsonResponse);
    } else {
      throw ServerException();
    }
  }
}
