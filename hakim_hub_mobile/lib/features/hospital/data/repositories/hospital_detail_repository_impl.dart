import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/core/network/network_info.dart';
import 'package:hakim_hub_mobile/features/hospital/data/datasources/hospital_detail_remote_datasource.dart';
import 'package:hakim_hub_mobile/features/hospital/data/models/filter_doctors_model.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/filter_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_detail_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/entities/hospital_doctor_domain.dart';
import 'package:hakim_hub_mobile/features/hospital/domain/repositories/hospital_detail_repository.dart';

/// Repository for fetching hospital detail data from a remote source.
class HospitalDetailRepositoryImpl implements HospitalDetailRepository {
  /// The remote data source where hospital data is fetched from.
  final HospitalDetailRemoteDataSource remoteDataSource;

  /// Provides network connectivity information.
  final NetworkInfo networkInfo;

  /// Create a new instance that fetches data from the provided [remoteDataSource].
  ///
  /// [networkInfo] is used to check for internet connectivity before making a request.
  HospitalDetailRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  /// Get the detailed data for a hospital by ID.
  ///
  /// If the device is connected to the internet, requests the data from
  /// [remoteDataSource]. Otherwise returns a [ServerFailure].

  @override
  Future<Either<Failure, InstitutionDetailDomain>> getHospitalDetail(
      String hospitalID) async {
    if (await networkInfo.isConnected) {
      try {
        final hospitalDetail =
            await remoteDataSource.getHospitalDetail(hospitalID);
        return Right(hospitalDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  /// Get a list of doctors filtered by the provided criteria.
  ///
  /// If the device has internet connectivity, requests matching doctors from
  /// [remoteDataSource]. Otherwise returns a [ServerFailure].
  @override
  Future<Either<Failure, List<DoctorDomain>>> getFilteredDoctors(
      DoctorFilterDomain doctorFilterDomain) async {
    if (await networkInfo.isConnected) {
      try {
        DoctorFilterModel doctorfilterModel = DoctorFilterModel(
            institutionId: doctorFilterDomain.institutionId,
            experienceYears: doctorFilterDomain.experienceYears,
            educationalName: doctorFilterDomain.educationalName,
            specialities: doctorFilterDomain.specialities);
        final hospitalDetail =
            await remoteDataSource.getDoctorByFilter(doctorfilterModel);
        return Right(hospitalDetail);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
