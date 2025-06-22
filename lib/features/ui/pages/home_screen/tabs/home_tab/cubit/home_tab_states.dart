import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabIntialState extends HomeTabStates {}

class CategoryInitialState extends HomeTabStates {}

class CategoryLoadingState extends HomeTabStates {}

class CategorySuccessState extends HomeTabStates {
  GetAllCategoryOrBrandResponseEntity getAllCategoryResponseEntity;
  CategorySuccessState({required this.getAllCategoryResponseEntity});
}

class CategoryErrorState extends HomeTabStates {
  Failures failures;
  CategoryErrorState({required this.failures});
}

class BrandInitialState extends HomeTabStates {}

class BrandLoadingState extends HomeTabStates {}

class BrandSuccessState extends HomeTabStates {
  GetAllCategoryOrBrandResponseEntity getAllCategoryOrBrandResponseEntity;
  BrandSuccessState({required this.getAllCategoryOrBrandResponseEntity});
}

class BrandErrorState extends HomeTabStates {
  Failures failures;
  BrandErrorState({required this.failures});
}
