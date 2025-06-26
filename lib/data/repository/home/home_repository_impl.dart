import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/home_remote_data_source.dart';
import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';
import 'package:e_commerece/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource getAllCategoryRemoteDataSource;

  HomeRepositoryImpl(this.getAllCategoryRemoteDataSource);
  @override
  Future<Either<Failures, GetAllCategoryOrBrandResponseEntity>>
      getCategory() async {
    var either = await getAllCategoryRemoteDataSource.getCategory();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetAllCategoryOrBrandResponseEntity>>
      getBrand() async {
    var either = await getAllCategoryRemoteDataSource.getBrand();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetProductResponseEntity>> getProducts() async {
    var either = await getAllCategoryRemoteDataSource.getProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(
      {required String productId}) async {
    var either =
        await getAllCategoryRemoteDataSource.addToCart(productId: productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
