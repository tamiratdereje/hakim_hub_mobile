import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_search_domain.dart';
import '../repositories/search_hospitals_repository.dart';

/// Use case for searching hospitals by name.
class GetHospitalsByName
    implements UseCase<List<InstitutionSearchDomain>, String> {
  /// The repository to search for hospitals.
  final HospitalsSearchRepository repository;

  /// Create an instance that will search in the provided [repository].
  GetHospitalsByName(this.repository);

  /// Execute this use case.
  ///
  /// Searches for hospitals by name in the [repository].
  ///
  /// Parameters:
  ///   name: Name to search hospitals by.
  ///
  /// Returns either a [Failure] or a list of [InstitutionSearchDomain] hospitals.
  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>> call(
      String name) async {
    return await repository.searchByNameHospitals(name);
  }
}
