import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/models/AddItemFavoriteResponseDto.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';

abstract class FavoriteRepository {
  Future<Either<Failures, AddItemFavoriteResponseEntity>> addItemFavorite(
      {required String productId});
  Future<Either<Failures, GetFavoriteItemResponseEntity>> getItemFavorite();
}
