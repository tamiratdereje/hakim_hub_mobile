
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_detail_domain.dart';
import '../repositories/search_hospitals_repository.dart';

class GetHospitalsByName implements UseCase<List<InstitutionDomain>, String> {
  final SearchHospitalsRepository repository;

  GetHospitalsByName(this.repository);

  @override
  Future<Either<Failure, List<InstitutionDomain>>> call(String params) async {
    return await repository.searchByNameHospitals(params);
  }
}