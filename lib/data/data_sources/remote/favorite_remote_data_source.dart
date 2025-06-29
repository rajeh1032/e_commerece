import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/entities/RemoveFavoriteItemResponseEntity.dart';

abstract class FavoriteRemoteDataSource {
  Future<Either<Failures, AddItemFavoriteResponseEntity>> addItemFavorite(
      {required String productId});

  Future<Either<Failures, GetFavoriteItemResponseEntity>> getItemFavorite();

  Future<Either<Failures, RemoveFavoriteItemEntity>> removeItemFavorite(
      {required String productId});
}
