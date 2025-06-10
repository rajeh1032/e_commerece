import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerece/data/models/RegisterResponseDm.dart';
import 'package:e_commerece/domain/entities/RegisterResponseEntity.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  //todo: هنا لازم يكون من نوع DM
  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
