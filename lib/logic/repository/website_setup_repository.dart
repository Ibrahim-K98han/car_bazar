import 'package:car_bazar/data/data_provider/local_data_source.dart';
import 'package:car_bazar/data/data_provider/remote_data_source.dart';
import 'package:car_bazar/data/model/website_model/website_model.dart';
import 'package:car_bazar/presentation/errors/exception.dart';
import 'package:car_bazar/presentation/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class WebsiteSetupRepository {
  Future<Either<Failure, WebsiteModel>> getWebsiteSetupData(Uri uri);

  Either<Failure, bool> checkOnBoarding();

  Future<Either<Failure, bool>> cachedOnBoarding();
}

class WebsiteSetupRepositoryImpl implements WebsiteSetupRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSources localDataSources;

  WebsiteSetupRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSources,
  });

  @override
  Future<Either<Failure, bool>> cachedOnBoarding() async {
    try {
      final result = await localDataSources.cachedOnBoarding();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Either<Failure, bool> checkOnBoarding() {
    try {
      return Right(localDataSources.checkOnBoarding());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, WebsiteModel>> getWebsiteSetupData(Uri uri) async {
    try {
      final result = await remoteDataSource.getWebsiteSetup(uri);
      final data = WebsiteModel.fromMap(result);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
