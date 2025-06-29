import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/RemoveFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveItemFavoriteUseCase {
  FavoriteRepository favoriteRepository;

  RemoveItemFavoriteUseCase({required this.favoriteRepository});

  Future<Either<Failures, RemoveFavoriteItemEntity>> invoke(
      {required String productId}) {
    return favoriteRepository.removeItemFavorite(productId: productId);
  }
}
