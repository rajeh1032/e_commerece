import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, GetAllCategoryOrBrandResponseEntity>> getCategory();
  Future<Either<Failures, GetAllCategoryOrBrandResponseEntity>> getBrand();
   Future<Either<Failures, GetProductResponseEntity>> getProducts();

     Future<Either<Failures, AddCartResponseEntity>> addToCart(
      {required String productId});
}
