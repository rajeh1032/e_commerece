import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends RegisterStates {
  Failures failures;
  RegisterErrorState({required this.failures});
}
