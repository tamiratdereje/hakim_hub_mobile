import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/educational_institute.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_address_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_availability_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/hospital_detail_repository.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/usecases/get_hospital_detail.dart';
import 'package:mockito/mockito.dart';
import 'get_doctor_by_filter_test.mocks.dart';

void main() {
  late GetHospitalDetail usecase;
  late MockHospitalDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockHospitalDetailRepository();
    usecase = GetHospitalDetail(mockRepository);
  });

  final tHospitalId = '123';
  final tInstitutionDetail = InstitutionDetailDomain(
    allSpecialities: ['Cardiology', 'Pediatrics', 'Neurology'],
    educationalInstitutions: [
      EductationalInstitutionDomain(
        institutionName: 'Medical School 1',
        logoUrl: 'https://medicalschool1.com/logo.jpg',
        id: '123',
      )
    ],
    institutionName: 'Hospital 1',
    branchName: 'Main Branch',
    website: 'https://hospital1.com',
    phoneNumber: '555-1234',
    summary:
        'Hospital 1 is a world-class medical facility with state-of-the-art equipment and highly trained staff.',
    establishedOn: DateTime(2000, 1, 1),
    rate: 4.5,
    status: 'Active',
    logoUrl: 'https://hospital1.com/logo.jpg',
    bannerUrl: 'https://hospital1.com/banner.jpg',
    institutionAvailability: InstitutionAvailabilityDomain(
      startDay: 'Monday',
      endDay: 'Friday',
      opening: '8:00 AM',
      closing: '5:00 PM',
      twentyFourHours: false,
      id: '123',
    ),
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
    services: ['Cardiology', 'Pediatrics', 'Neurology', 'Radiology'],
    photos: [
      'https://hospital1.com/photo1.jpg',
      'https://hospital1.com/photo2.jpg',
    ],
    doctors: [
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
        about:
            'Dr. John Doe is a cardiologist with over 7 years of experience.',
      ),
      DoctorDomain(
        id: '2',
        fullName: 'Jane Smith',
        gender: 'Female',
        yearsOfExperience: 10,
        specialities: ['Pediatrics', 'Neurology'],
        mainInstitutionId: '123',
        mainInstitutionName: 'Hospital 1',
        email: 'jane.smith@example.com',
        photoUrl: 'https://doctors.com/2.jpg',
        about:
            'Dr. Jane Smith is a pediatrician with over 10 years of experience.',
      ),
    ],
    id: '123',
  );

  test(
      'should get hospital detail for the given hospital id from the repository',
      () async {
    // arrange
    when(mockRepository.getHospitalDetail(any))
        .thenAnswer((_) async => Right(tInstitutionDetail));
    // act
    final result = await usecase(tHospitalId);
    // assert
    expect(result, Right(tInstitutionDetail));
    verify(mockRepository.getHospitalDetail(tHospitalId));
    verifyNoMoreInteractions(mockRepository);
  });
}
