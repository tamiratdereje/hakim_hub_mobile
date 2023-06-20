import 'package:dartz/dartz.dart';
import 'package:hakim_hub_mobile/core/error/exception.dart';
import 'package:hakim_hub_mobile/core/error/failures.dart';
import 'package:hakim_hub_mobile/core/network/network_info.dart';
import 'package:hakim_hub_mobile/features/doctor/data/datasources/doctor_detail_datasource.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/entities/doctor_detail.dart';
import 'package:hakim_hub_mobile/features/doctor/domain/repositories/doctor_detail_repository.dart';

class DoctorDetailRepositoryImpl implements DoctorDetailRepository {
  final DoctorDetailRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DoctorDetailRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<Either<Failure, DoctorDetail>> getDoctorDetail(String id) async {
    try {
      final doctorDetail = await remoteDataSource.getDoctorDetail(id);
      return Right(doctorDetail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
