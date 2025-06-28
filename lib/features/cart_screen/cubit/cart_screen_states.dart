import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/models/RemoveSpecificCartItemDto.dart';
import 'package:e_commerece/data/models/UpdateCartItemResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/RemoveSpecificCartItemEntity.dart';
import 'package:e_commerece/domain/entities/UpdateCartItemResponseEntity.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {}

class CartScreenSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;

  CartScreenSuccessState({required this.getCartResponseEntity});
}

class CartScreenErrorState extends CartScreenStates {
  Failures failures;
  CartScreenErrorState({required this.failures});
}

class RemoveCartItemInitialState extends CartScreenStates {}

class RemoveCartItemLoadingState extends CartScreenStates {}

class RemoveCartItemSuccessState extends CartScreenStates {
  RemoveCartItemResponseEntity removeCartItemResponseEntity;

  RemoveCartItemSuccessState({required this.removeCartItemResponseEntity});
}

class RemoveCartItemErrorState extends CartScreenStates {
  Failures failures;
  RemoveCartItemErrorState({required this.failures});
}

class UpdateCartItemInitialState extends CartScreenStates {}

class UpdateCartItemLoadingState extends CartScreenStates {}

class UpdateCartItemSuccessState extends CartScreenStates {
  UpdateCartItemResponseEntity updateCartItemResponseEntity;

  UpdateCartItemSuccessState({required this.updateCartItemResponseEntity});
}

class UpdateCartItemErrorState extends CartScreenStates {
  Failures failures;
  UpdateCartItemErrorState({required this.failures});
}
