import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_search_domain.dart';
import '../repositories/search_hospitals_repository.dart';

/// Use case for searching hospitals by filter criteria.
class GetHospitalsByFilter
    implements UseCase<List<InstitutionSearchDomain>, FilterHospitalDomain> {
  /// The repository to search for hospitals.
  final HospitalsSearchRepository repository;

  /// Create an instance that will search in the provided [repository].
  GetHospitalsByFilter(this.repository);

  /// Execute this use case.
  ///
  /// Searches for hospitals in the [repository] based on the provided filter criteria.
  ///
  /// Parameters:
  ///   filterCriteria: Criteria to filter hospitals by.
  ///
  /// Returns either a [Failure] or a list of [InstitutionSearchDomain] hospitals.

  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>> call(
      FilterHospitalDomain filterCriteria) async {
    return await repository.searchByFilterHospitals(filterCriteria);
  }
}
