import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase {
  HomeRepository homeRepository;
  GetProductsUseCase({required this.homeRepository});

  Future<Either<Failures, GetProductResponseEntity>> invoke() {
    return homeRepository.getProducts();
  }
}
