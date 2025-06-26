import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerece/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductCartUseCase {
  HomeRepository homeRepository;
  AddProductCartUseCase({required this.homeRepository});

  Future<Either<Failures, AddCartResponseEntity>> invoke(
      {required String productId}) {
    return homeRepository.addToCart(productId: productId);
  }
}
