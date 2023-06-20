


import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_detail_domain.dart';
import '../repositories/search_hospitals_repository.dart';

class GetHospitalsByFilter implements UseCase<List<InstitutionDomain>, FilterHospitalDomain> {
  final SearchHospitalsRepository repository;

  GetHospitalsByFilter(this.repository);

  @override
  Future<Either<Failure, List<InstitutionDomain>>> call(FilterHospitalDomain params) async {
    return await repository.searchByFilterHospitals(params);
  }
}