import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/filter_hospital_model.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_hospital_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_search_domain.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/search_hospitals_repository.dart';
import '../datasources/hospital_remote_datasource.dart';

/// Implementation of [HospitalsSearchRepository] to search for hospitals.
class HospitalSearchRepositoryImpl implements HospitalsSearchRepository {
  /// The remote data source to search hospitals from.
  final HospitalSearchRemoteDataSource remoteDataSource;

  /// Provides network connectivity information.
  final NetworkInfo networkInfo;

  /// Create new instance with required dependencies.
  HospitalSearchRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  /// Search hospitals matching the provided filter criteria.
  ///
  /// Calls remote data source if device is online, otherwise returns [ServerFailure].
  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>>
      searchByFilterHospitals(FilterHospitalDomain filterHospital) async {
    if (await networkInfo.isConnected) {
      try {
        FilterHospitalModel filterHospitalModel = FilterHospitalModel(
            activeFor: filterHospital.operationYears,
            openNow: filterHospital.openStatus,
            services: filterHospital.services);
        final remoteHospitals =
            await remoteDataSource.searchByFilterHospitals(filterHospitalModel);
        return Right(remoteHospitals);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  /// Search hospitals by name.
  ///
  /// Requests remote data source if connected, otherwise returns [ServerFailure].
  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>> searchByNameHospitals(
      String name) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHospitals =
            await remoteDataSource.searchByNameHospitals(name);
        return Right(remoteHospitals);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  /// Get all hospitals.
  ///
  /// Fetches from remote if device is online, otherwise returns [ServerFailure].
  @override
  Future<Either<Failure, List<InstitutionSearchDomain>>>
      getAllHospitals() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteHospitals = await remoteDataSource.getAllHospitals();
        return Right(remoteHospitals);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
