import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_detail.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_experience.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/repositories/doctor_detail_repository.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/usecases/doctor_detail_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/features/doctor/domain/entities/doctor_education.dart';
import 'doctor_detail_test.mocks.dart';

@GenerateMocks([DoctorDetailRepository])
void main() {
  late GetDoctorDetail usecase;
  late MockDoctorDetailRepository mockRepository;

  setUp(() {
    mockRepository = MockDoctorDetailRepository();
    usecase = GetDoctorDetail(doctorDetailRepository: mockRepository);
  });

  final testId = '123';

  final testDoctorDetail = DoctorDetail(
    fullName: 'John Doe',
    about: 'Lorem ipsum',
    educations: [
      Education(
        degree: 'Doctor of Medicine',
        institution: 'Medical University',
        startDate: DateTime(2015),
        endDate: DateTime(2020),
        fieldOfStudy: 'Internal Medicine',
        logoUrl: 'https://example.com/university_logo.png',
      ),
    ],
    email: 'johndoe@example.com',
    experiences: [
      Experience(
        title: 'Senior Physician',
        description: 'Lorem ipsum dolor sit amet',
        institution: 'ABC Hospital',
        startDate: DateTime(2020),
        endDate: DateTime(2023),
      ),
    ],
    gender: 'Male',
    id: testId,
    mainInstitutionId: '456',
    mainInstitutionName: 'ABC Hospital',
    photoUrl: 'https://example.com/photo.jpg',
    specialities: ['Cardiology', 'Internal Medicine'], // Example specialities
    yearsOfExperience: 5,
  );

  test('should get doctor detail from the repository', () async {
    // Arrange
    when(mockRepository.getDoctorDetail(testId))
        .thenAnswer((_) async => Right(testDoctorDetail));

    // Act
    final result = await usecase.call(testId);

    // Assert
    expect(result, Right(testDoctorDetail));
    verify(mockRepository.getDoctorDetail(testId));
    verifyNoMoreInteractions(mockRepository);
  });
}
