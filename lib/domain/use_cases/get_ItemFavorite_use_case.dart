import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/repositories/favorite/favorite_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetItemfavoriteUseCase {
  FavoriteRepository favoriteRepository;

  GetItemfavoriteUseCase({required this.favoriteRepository});

  Future<Either<Failures, GetFavoriteItemResponseEntity>> invoke() {
    return favoriteRepository.getItemFavorite();
  }
}
