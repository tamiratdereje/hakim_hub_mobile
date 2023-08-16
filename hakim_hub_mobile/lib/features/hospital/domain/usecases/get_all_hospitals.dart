import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_search_domain.dart';
import '../repositories/search_hospitals_repository.dart';

/// Use case for retrieving all hospitals.
class GetAllHospitals
    implements UseCase<List<InstitutionSearchDomain>, NoParams> {
  /// The repository to retrieve hospitals from.
  final HospitalsSearchRepository repository;

  /// Create an instance that will get hospitals from the provided [repository].
  GetAllHospitals(this.repository);

  /// Execute this use case.
  ///
  /// Gets all hospitals from the [repository].
  ///
  /// Returns either a [Failure] or the list of [InstitutionSearchDomain] hospitals.
  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>> call(
      NoParams noParams) async {
    return await repository.getAllHospitals();
  }
}
