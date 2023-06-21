import 'dart:convert';
import 'dart:io';

import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/features/doctor/data/models/doctor_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:hakim_hub_mobile/core/utils/base_url.dart';

abstract class DoctorDetailRemoteDataSource {
  Future<DoctorDetailModel> getDoctorDetail(String id);
}

class DoctorDetailRemoteDataSourceImpl implements DoctorDetailRemoteDataSource {
  final http.Client client;
  final uriString = 'https://jsonplaceholder.typicode.com/todos/1';
  String baseUrl = getBaseUrl();

  DoctorDetailRemoteDataSourceImpl({required this.client});

  @override
  Future<DoctorDetailModel> getDoctorDetail(String id) async {
    final response = await client.get(
      Uri.parse(uriString),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DoctorDetailModel.fromJson(jsonResponse);
    } else {
      throw ServerException();
    }
  }
}
