import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/repositories/cart/cart_reopsitory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource cartRemoteDataSource;

  CartRepositoryImpl(this.cartRemoteDataSource);
  @override
  Future<Either<Failures, GetCartResponseEntity>> getItemInCart() async {
    var either = await cartRemoteDataSource.getItemInCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
