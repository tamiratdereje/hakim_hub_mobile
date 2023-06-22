import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_detail.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/hospital_doctor_model.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/doctor_filter_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';

import '../repositories/hospital_detail_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/hospital_search_domain.dart';

class GetDoctoreByFilter
    implements UseCase<List<DoctorDomain>, DoctorFilterDomain> {
  final HospitalDetailRepository repository;

  GetDoctoreByFilter(this.repository);

  @override
  Future<Either<Failure, List<DoctorDomain>>> call(
      DoctorFilterDomain params) async {
    return await repository.getFilteredDoctors(params);
  }
}
