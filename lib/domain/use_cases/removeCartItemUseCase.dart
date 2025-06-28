import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/RemoveSpecificCartItemEntity.dart';
import 'package:e_commerece/domain/repositories/cart/cart_reopsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class Removecartitemusecase {
  CartRepository cartRepository;
  Removecartitemusecase({required this.cartRepository});

  Future<Either<Failures, RemoveCartItemResponseEntity>> invoke(
      {required String productId}) {
    return cartRepository.removeCartItem(productId: productId);
  }
}
