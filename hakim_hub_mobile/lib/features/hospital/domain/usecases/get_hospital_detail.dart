import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/core/usecases/usecase.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/hospital_detail_repository.dart';

/// Use case for getting detailed hospital data.
class GetHospitalDetail implements UseCase<InstitutionDetailDomain, String> {
  /// The repository to retrieve hospital details from.
  final HospitalDetailRepository repository;

  /// Create an instance that will get hospital details from the provided [repository].
  GetHospitalDetail(this.repository);

  /// Execute this use case.
  ///
  /// Gets the detailed hospital data from the [repository] for the provided ID.
  ///
  /// Parameters:
  ///   hospitalId: ID of the hospital to get details for.
  ///
  /// Returns either a [Failure] or the [InstitutionDetailDomain] hospital details.
  @override
  Future<Either<Failure, InstitutionDetailDomain>> call(
      String hospitalId) async {
    return await repository.getHospitalDetail(hospitalId);
  }
}
