import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/favorite_remote_data_source.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/entities/RemoveFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteRepository)
class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRemoteDataSource favoriteRemoteDataSource;

  FavoriteRepositoryImpl({required this.favoriteRemoteDataSource});
  @override
  Future<Either<Failures, AddItemFavoriteResponseEntity>> addItemFavorite(
      {required String productId}) async {
    var either =
        await favoriteRemoteDataSource.addItemFavorite(productId: productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetFavoriteItemResponseEntity>>
      getItemFavorite() async {
    var either = await favoriteRemoteDataSource.getItemFavorite();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, RemoveFavoriteItemEntity>> removeItemFavorite(
      {required String productId}) async {
    var either =
        await favoriteRemoteDataSource.removeItemFavorite(productId: productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
