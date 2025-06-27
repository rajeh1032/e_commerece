import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';

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
