import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/UpdateCartItemResponseEntity.dart';
import 'package:e_commerece/domain/repositories/cart/cart_reopsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartItemUseCase {
  CartRepository cartRepository;
  UpdateCartItemUseCase({required this.cartRepository});

  Future<Either<Failures, UpdateCartItemResponseEntity>> invoke(
      {required String productId, required String count}) {
    return cartRepository.updateCartItem(productId: productId, count: count);
  }
}
