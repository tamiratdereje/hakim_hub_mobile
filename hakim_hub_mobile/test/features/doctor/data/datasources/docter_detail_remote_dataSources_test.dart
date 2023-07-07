import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/features/doctor/data/datasources/doctor_detail_remote_datasource.dart';
import 'package:hakim_hub_mobile/features/doctor/data/models/doctor_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'docter_detail_remote_dataSources_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late DoctorDetailRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = DoctorDetailRemoteDataSourceImpl(client: mockHttpClient);
  });

  final tDoctorDetailModel = DoctorDetailModel(
    fullName: 'Dr. John Doe',
    about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    educations: [],
    email: 'johndoe@gmail.com',
    experiences: [],
    gender: 'Male',
    id: '12345',
    mainInstitutionId: '67890',
    mainInstitutionName: 'Harvard Medical School',
    photoUrl: 'https://via.placeholder.com/150',
    specialities: ['Cardiology', 'Internal Medicine'],
    yearsOfExperience: 13,
  );

  final tDoctorId = '12345';

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(
      Uri.parse('https://hakim-hub.onrender.com/api/DoctorProfiles/12345'),
      headers: {'Content-Type': 'application/json'},
    )).thenAnswer(
      (_) async => http.Response(
        json.encode(tDoctorDetailModel.toJson()),
        200,
      ),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(
      Uri.parse('https://hakim-hub.onrender.com/api/DoctorProfiles/12345'),
      headers: {'Content-Type': 'application/json'},
    )).thenAnswer(
      (_) async => http.Response('Not Found', 404),
    );
  }

  group('getDoctorDetail', () {
    test(
      'should perform a GET request on a URL with doctor ID being the endpoint and with application/json header',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getDoctorDetail(tDoctorId);
        // assert
        verify(mockHttpClient.get(
          Uri.parse('https://example.com/DoctorProfiles/12345'),
          headers: {'Content-Type': 'application/json'},
        ));
      },
    );

    test(
      'should return DoctorDetailModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getDoctorDetail(tDoctorId);
        // assert
        expect(result, equals(tDoctorDetailModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getDoctorDetail;
        // assert
        expect(() => call(tDoctorId), throwsA(isInstanceOf<ServerException>()));
      },
    );
  });
}
