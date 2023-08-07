import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/core/usecases/usecase.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/hospital_detail_repository.dart';

/// Use case for getting doctors by filter criteria.
class GetDoctorByFilter
    implements UseCase<List<DoctorDomain>, DoctorFilterDomain> {
  /// The repository to retrieve doctors from.
  final HospitalDetailRepository repository;

  /// Create an instance that will get doctors from the provided [repository].
  GetDoctorByFilter(this.repository);

  /// Execute this use case.
  ///
  /// Gets a list of doctors from the [repository] filtered by the provided criteria.
  ///
  /// Parameters:
  ///   filterCriteria: The criteria to filter doctors by.
  ///

  /// Returns either a [Failure] or the list of [DoctorDomain] doctors.
  @override
  Future<Either<Failure, List<DoctorDomain>>> call(
      DoctorFilterDomain filterCriteria) async {
    return await repository.getFilteredDoctors(filterCriteria);
  }
}
