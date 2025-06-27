import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/repositories/cart/cart_reopsitory.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemInCartUseCase {
  CartRepository cartReopsitory;
  GetItemInCartUseCase({required this.cartReopsitory});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartReopsitory.getItemInCart();
  }
}
