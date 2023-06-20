import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/hospital_detail_domain.dart';

abstract class SearchHospitalsRepository {
  Future<Either<Failure, List<InstitutionDomain>>> searchByFilterHospitals(
      FilterHospitalDomain filterHospitalDomain);

  Future<Either<Failure, List<InstitutionDomain>>> searchByNameHospitals(
      String name);
}