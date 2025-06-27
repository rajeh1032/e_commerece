import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart();
}
