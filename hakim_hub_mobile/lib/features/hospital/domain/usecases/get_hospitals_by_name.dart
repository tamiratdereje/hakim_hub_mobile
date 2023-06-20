
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_search_domain.dart';
import '../repositories/search_hospitals_repository.dart';

class GetHospitalsByName implements UseCase<List<InstitutionSearchDomain>, String> {
  final HospitalsRepository repository;

  GetHospitalsByName(this.repository);

  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>> call(String params) async {
    return await repository.searchByNameHospitals(params);
  }
}