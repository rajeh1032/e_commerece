import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends LoginStates {
  Failures failures;
  LoginErrorState({required this.failures});
}
