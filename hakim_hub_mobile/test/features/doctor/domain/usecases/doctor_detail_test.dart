//Importing necessary packages and files
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_detail.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_education.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_experience.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/repositories/doctor_detail_repository.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/usecases/doctor_detail_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'doctor_detail_test.mocks.dart';

//Defining a mock class using the Mockito package
@GenerateMocks([DoctorDetailRepository])
void main() {
  //Declaring variables to be used in the tests
  late GetDoctorDetail usecase;
  late MockDoctorDetailRepository mockRepository;

  //Setting up the tests
  setUp(() {
    mockRepository = MockDoctorDetailRepository();
    usecase = GetDoctorDetail(doctorDetailRepository: mockRepository);
  });

  final tId = '1';
  final tDoctorDetail = DoctorDetail(
    fullName: 'Dr. John Doe',
    about: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    educations: [
      Education(
        degree: 'Doctor of Medicine (MD)',
        institution: 'Harvard Medical School',
        startDate: DateTime(2006, 9),
        endDate: DateTime(2010, 5),
        fieldOfStudy: 'Medicine',
        logoUrl: 'https://via.placeholder.com/150',
      ),
      Education(
        degree: 'Doctor of Medicine (MD)',
        institution: 'Harvard Medical School',
        startDate: DateTime(2006, 9),
        endDate: DateTime(2010, 5),
        fieldOfStudy: 'Medicine',
        logoUrl: 'https://via.placeholder.com/150',
      ),
    ],
    email: 'johndoe@gmail.com',
    experiences: [
      Experience(
        title: 'Resident Physician',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        institution: 'Massachusetts General Hospital',
        startDate: DateTime(2010, 7),
        endDate: DateTime(2013, 6),
      ),
      Experience(
        title: 'Resident Physician',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        institution: 'Massachusetts General Hospital',
        startDate: DateTime(2010, 7),
        endDate: DateTime(2013, 6),
      ),
    ],
    gender: 'Male',
    id: '12345',
    mainInstitutionId: '67890',
    mainInstitutionName: 'Harvard Medical School',
    photoUrl: 'https://via.placeholder.com/150',
    specialities: ['Cardiology', 'Internal Medicine'],
    yearsOfExperience: 13,
  );

  //Unit test to ensure that the usecase returns the correct doctor detail
  test('should get doctor detail for the given id from the repository',
      () async {
    // arrange
    when(mockRepository.getDoctorDetail(any))
        .thenAnswer((_) async => Right(tDoctorDetail));
    // act
    final result = await usecase.call(tId);
    // assert
    expect(result, Right(tDoctorDetail));
    verify(mockRepository.getDoctorDetail(tId));
    verifyNoMoreInteractions(mockRepository);
  });

  //Unit test to ensure that the usecase returns a failure when getting doctor detail fails
  test('should return failure when getting doctor detail fails', () async {
    // arrange
    when(mockRepository.getDoctorDetail(any))
        .thenAnswer((_) async => Left(ServerFailure()));
    // act
    final result = await usecase.call(tId);
    // assert
    expect(result, Left(ServerFailure()));
    verify(mockRepository.getDoctorDetail(tId));
    verifyNoMoreInteractions(mockRepository);
  });
}
