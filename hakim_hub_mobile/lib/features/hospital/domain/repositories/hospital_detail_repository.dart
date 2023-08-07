import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';

import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';

/// Repository for fetching hospital detail data.
abstract class HospitalDetailRepository {
  /// Get the detailed data for a hospital by ID.
  ///
  /// Returns either a [Failure] or the [InstitutionDetailDomain] hospital data.
  Future<Either<Failure, InstitutionDetailDomain>> getHospitalDetail(
      String hospitalID);

  /// Get a list of doctors filtered by the provided criteria.
  ///
  /// Returns either a [Failure] or a list of [DoctorDomain] matching the filter.
  Future<Either<Failure, List<DoctorDomain>>> getFilteredDoctors(
      DoctorFilterDomain filterCriteria);
}
