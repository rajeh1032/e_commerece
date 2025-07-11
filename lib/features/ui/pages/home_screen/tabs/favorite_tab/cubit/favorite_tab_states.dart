import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/models/GetFavoriteItemResponseDto.dart';
import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/domain/entities/RemoveFavoriteItemResponseEntity.dart';

abstract class FavoriteTabStates {}

class FavoriteInitialState extends FavoriteTabStates {}

class FavoriteLoadingState extends FavoriteTabStates {}

class FavoriteSuccessState extends FavoriteTabStates {
  AddItemFavoriteResponseEntity addItemFavoriteResponseEntity;
  FavoriteSuccessState({required this.addItemFavoriteResponseEntity});
}

class FavoriteErrorState extends FavoriteTabStates {
  Failures failures;
  FavoriteErrorState({required this.failures});
}

class GetFavoriteInitialState extends FavoriteTabStates {}

class GetFavoriteLoadingState extends FavoriteTabStates {}

class GetFavoriteSuccessState extends FavoriteTabStates {
  GetFavoriteItemResponseEntity getFavoriteItemResponseEntity;
  GetFavoriteSuccessState({required this.getFavoriteItemResponseEntity});
}

class GetFavoriteErrorState extends FavoriteTabStates {
  Failures failures;
  GetFavoriteErrorState({required this.failures});
}

class RemoveItemFavoriteInitialState extends FavoriteTabStates {}

class RemoveItemFavoriteLoadingState extends FavoriteTabStates {}

class RemoveItemFavoriteSuccessState extends FavoriteTabStates {
  RemoveFavoriteItemEntity removeFavoriteItemEntity;
  RemoveItemFavoriteSuccessState({required this.removeFavoriteItemEntity});
}

class RemoveItemFavoriteErrorState extends FavoriteTabStates {
  Failures failures;
  RemoveItemFavoriteErrorState({required this.failures});
}
