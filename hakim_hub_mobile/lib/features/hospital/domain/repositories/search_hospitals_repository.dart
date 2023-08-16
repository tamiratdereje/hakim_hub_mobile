import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/hospital_search_domain.dart';

/// Repository for searching and retrieving hospitals.
abstract class HospitalsSearchRepository {
  /// Search for hospitals matching the provided filter criteria.
  ///
  /// Returns either a [Failure] or a list of [InstitutionSearchDomain] hospitals.
  Future<Either<Failure, List<InstitutionSearchDomain>>>
      searchByFilterHospitals(FilterHospitalDomain filterCriteria);

  /// Search for hospitals by name.
  ///
  /// Returns either a [Failure] or a list of [InstitutionSearchDomain] hospitals.
  Future<Either<Failure, List<InstitutionSearchDomain>>> searchByNameHospitals(
      String name);

  /// Get all hospitals.
  ///
  /// Returns either a [Failure] or a list of all [InstitutionSearchDomain] hospitals.
  Future<Either<Failure, List<InstitutionSearchDomain>>> getAllHospitals();
}
