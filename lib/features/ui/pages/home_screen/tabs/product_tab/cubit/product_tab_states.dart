import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';

abstract class ProductTabStates {}

class ProductInitialState extends ProductTabStates {}

class ProductLoadingState extends ProductTabStates {}

class ProductSuccessState extends ProductTabStates {
  GetProductResponseEntity getProductResponseEntity;
  ProductSuccessState({required this.getProductResponseEntity});
}

class ProductErrorState extends ProductTabStates {
  Failures failures;
  ProductErrorState({required this.failures});
}

class AddCartInitialState extends ProductTabStates {}

class AddCarLoadingState extends ProductTabStates {}

class AddCarSuccessState extends ProductTabStates {
  AddCartResponseEntity addCartResponseEntity;
  AddCarSuccessState({required this.addCartResponseEntity});
}

class AddCarErrorState extends ProductTabStates {
  Failures failures;
  AddCarErrorState({required this.failures});
}
