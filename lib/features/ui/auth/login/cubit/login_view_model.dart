import 'package:e_commerece/domain/use_cases/login_use_case.dart';
import 'package:e_commerece/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());
  //todo: hold data -- handle logic

  TextEditingController mailControler =
      TextEditingController(text: "ahhmedra1@gmail.com");
  TextEditingController passwordControler =
      TextEditingController(text: "001122@A");

  var formKey = GlobalKey<FormState>();
  void login() async {
    if (formKey.currentState?.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
        mailControler.text,
        passwordControler.text,
      );
      either.fold(
        (error) => emit(LoginErrorState(failures: error)),
        (response) => emit(LoginSuccessState(loginResponseEntity: response)),
      );
    }
  }
}
