import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_search_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/hospital_detail_repository.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_doctor_by_filter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_doctor_by_filter_test.mocks.dart';

@GenerateMocks([HospitalDetailRepository])
void main() {
  late MockHospitalDetailRepository mockRepository;
  late GetDoctorByFilter useCase;
  final filter = DoctorFilterDomain(
    institutionId: '123',
    experienceYears: '5',
    educationalName: 'Harvard Medical School',
    specialities: ['Cardiology', 'Pediatrics'],
  );
  final tDoctorsList = [
    DoctorDomain(
      id: '1',
      fullName: 'John Doe',
      gender: 'Male',
      yearsOfExperience: 7,
      specialities: ['Cardiology', 'Pediatrics'],
      mainInstitutionId: '123',
      mainInstitutionName: 'Hospital 1',
      email: 'john.doe@example.com',
      photoUrl: 'https://doctors.com/1.jpg',
      about: 'Dr. John Doe is a cardiologist with over 7 years of experience.',
    ),
    DoctorDomain(
      id: '2',
      fullName: 'Jane Smith',
      gender: 'Female',
      yearsOfExperience: 10,
      specialities: ['Pediatrics', 'Neurology'],
      mainInstitutionId: '456',
      mainInstitutionName: 'Hospital 2',
      email: 'jane.smith@example.com',
      photoUrl: 'https://doctors.com/2.jpg',
      about:
          'Dr. Jane Smith is a pediatrician with over 10 years of experience.',
    ),
  ];

  setUp(() {
    mockRepository = MockHospitalDetailRepository();
    useCase = GetDoctorByFilter(mockRepository);
  });

  test('should get a list of doctors from the repository', () async {
    // arrange
    when(mockRepository.getFilteredDoctors(any))
        .thenAnswer((_) async => Right(tDoctorsList));
    // act
    final result = await useCase(filter);
    // assert
    expect(result, Right(tDoctorsList));
    verify(mockRepository.getFilteredDoctors(filter));
    verifyNoMoreInteractions(mockRepository);
  });
}