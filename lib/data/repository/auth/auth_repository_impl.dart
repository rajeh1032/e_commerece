import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerece/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerece/domain/repositories/auth/auth_repostiory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    // TODO: implement register
    var either = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
