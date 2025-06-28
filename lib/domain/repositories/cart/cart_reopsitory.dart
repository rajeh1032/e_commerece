import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/RemoveSpecificCartItemEntity.dart';
import 'package:e_commerece/domain/entities/UpdateCartItemResponseEntity.dart';

abstract class CartRepository {
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart();
  Future<Either<Failures, RemoveCartItemResponseEntity>> removeCartItem({
    required String productId,
  });
  Future<Either<Failures, UpdateCartItemResponseEntity>> updateCartItem(
      {required String productId, required String count});
}
