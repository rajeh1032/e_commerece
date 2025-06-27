import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart();
}
