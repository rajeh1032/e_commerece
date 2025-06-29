import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddItemFavoriteUseCase {
  FavoriteRepository favoriteRepository;

  AddItemFavoriteUseCase({required this.favoriteRepository});

  Future<Either<Failures, AddItemFavoriteResponseEntity>> invoke(
      {required String productId}) {
    return favoriteRepository.addItemFavorite(productId: productId);
  }
}
