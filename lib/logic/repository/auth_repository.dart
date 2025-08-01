import 'package:car_bazar/data/data_provider/local_data_source.dart';
import 'package:car_bazar/data/data_provider/remote_data_source.dart';
import 'package:car_bazar/data/model/auth/login_state_model.dart';
import 'package:car_bazar/data/model/auth/user_response_model.dart';
import 'package:car_bazar/presentation/errors/exception.dart';
import 'package:car_bazar/presentation/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<dynamic, UserResponseModel>> login(LoginStateModel body);

  Either<Failure, UserResponseModel> getExistingUserInfo();
}

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSources;
  final LocalDataSources localDataSources;

  AuthRepositoryImpl({
    required this.remoteDataSources,
    required this.localDataSources,
  });

  @override
  Future<Either<dynamic, UserResponseModel>> login(LoginStateModel body) async {
    try {
      final result = await remoteDataSources.login(body);
      final response = UserResponseModel.fromMap(result);
      localDataSources.cacheUserResponse(response);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  @override
  Either<Failure, UserResponseModel> getExistingUserInfo() {
    try {
      final result = localDataSources.getExistingUserInfo();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
