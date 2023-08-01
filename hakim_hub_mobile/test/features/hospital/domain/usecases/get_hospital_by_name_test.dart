import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_address_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_availability_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_search_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/search_hospitals_repository.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_hospitals_by_name.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_hospital_by_filter.mocks.dart';


@GenerateMocks([HospitalsSearchRepository])
void main() {
  late GetHospitalsByName usecase;
  late HospitalsSearchRepository mockRepository;

  setUp(() {
    mockRepository = MockHospitalsSearchRepository();
    usecase = GetHospitalsByName(mockRepository);
  });

  final tSearchQuery = 'hospital';

  final tInstitutionSearchList = [
    InstitutionSearchDomain(
      id: '1',
      institutionName: 'Hospital 1',
      branchName: 'Main Branch',
      website: 'https://hospital1.com',
      phoneNumber: '123-456-7890',
       address: AddressDomain(
      country: 'Ethiopia',
      region: 'Addis Ababa',
      zone: 'Bole',
      woreda: 'Woreda 1',
      city: 'Addis Ababa',
      subCity: 'Bole',
      longitude: 38.76,
      latitude: 9.02,
      summary: '123 Main St, Bole, Addis Ababa',
      id: '123',
    ),
      summary: 'A great hospital!',
      establishedOn: DateTime(2000, 1, 1),
      rate: 4.5,
      status: 'Open',
      logoUrl: 'https://hospital1.com/logo.png',
      bannerUrl: 'https://hospital1.com/banner.jpg',
      institutionAvailability: InstitutionAvailabilityDomain(
      startDay: 'Monday',
      endDay: 'Friday',
      opening: '8:00 AM',
      closing: '5:00 PM',
      twentyFourHours: false,
      id: '123',
    ),
      services: ['cardiology', 'neurology'],
    ),
    InstitutionSearchDomain(
      id: '2',
      institutionName: 'Hospital 2',
      branchName: 'Main Branch',
      website: 'https://hospital2.com',
      phoneNumber: '555-555-5555',
      address: AddressDomain(
      country: 'Ethiopia',
      region: 'Addis Ababa',
      zone: 'Bole',
      woreda: 'Woreda 1',
      city: 'Addis Ababa',
      subCity: 'Bole',
      longitude: 38.76,
      latitude: 9.02,
      summary: '123 Main St, Bole, Addis Ababa',
      id: '123',
    ),
      summary: 'Another great hospital!',
      establishedOn: DateTime(2010, 1, 1),
      rate: 4.2,
      status: 'Open',
      logoUrl: 'https://hospital2.com/logo.png',
      bannerUrl: 'https://hospital2.com/banner.jpg',
      institutionAvailability: InstitutionAvailabilityDomain(
      startDay: 'Monday',
      endDay: 'Friday',
      opening: '8:00 AM',
      closing: '5:00 PM',
      twentyFourHours: false,
      id: '123',
    ),
      services: ['dermatology', 'ophthalmology'],
    ),
  ];

  test(
    'should return a list of InstitutionSearchDomain from the repository',
    () async {
      // arrange
      when(mockRepository.searchByNameHospitals(tSearchQuery))
          .thenAnswer((_) async => Right(tInstitutionSearchList));
      // act
      final result = await usecase(tSearchQuery);
      // assert
      expect(result, Right(tInstitutionSearchList));
      verify(mockRepository.searchByNameHospitals(tSearchQuery));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}