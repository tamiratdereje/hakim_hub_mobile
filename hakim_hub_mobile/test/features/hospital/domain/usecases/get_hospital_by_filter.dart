import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_address_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_availability_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_search_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/search_hospitals_repository.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_hospitals_by_filter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_hospital_by_filter.mocks.dart';

@GenerateMocks([HospitalsSearchRepository])
void main() {
  late GetHospitalsByFilter usecase;
  late HospitalsSearchRepository mockRepository;

  setUp(() {
    mockRepository = MockHospitalsSearchRepository();
    usecase = GetHospitalsByFilter(mockRepository);
  });

  final tFilterDomain = FilterHospitalDomain(
    openStatus: true,
    operationYears: 5,
    services: ['cardiology', 'neurology'],
  );
  

  final tInstitutionSearchList = [
    InstitutionSearchDomain(
      id: '1',
      institutionName: 'Hospital 1',
      branchName: 'Main Branch',
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
      website: 'https://hospital1.com',
      phoneNumber: '123-456-7890',
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
      institutionName: 'Clinic 1',
      branchName: 'Main Branch',
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
      website: 'https://clinic1.com',
      phoneNumber: '555-555-5555',
      summary: 'A great clinic!',
      establishedOn: DateTime(2010, 1, 1),
      rate: 4.2,
      status: 'Open',
      logoUrl: 'https://clinic1.com/logo.png',
      bannerUrl: 'https://clinic1.com/banner.jpg',
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
      when(mockRepository.searchByFilterHospitals(tFilterDomain))
          .thenAnswer((_) async => Right(tInstitutionSearchList));
      // act
      final result = await usecase(tFilterDomain);
      // assert
      expect(result, Right(tInstitutionSearchList));
      verify(mockRepository.searchByFilterHospitals(tFilterDomain));
      verifyNoMoreInteractions(mockRepository);
    },
  );
}