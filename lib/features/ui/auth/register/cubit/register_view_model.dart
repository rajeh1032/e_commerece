import 'package:e_commerece/domain/use_cases/register_use_case.dart';
import 'package:e_commerece/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());
  //todo: hold data -- handle logic
  TextEditingController fullNameControler =
      TextEditingController(text: "ahmed Rajeh");
  TextEditingController phoneControler =
      TextEditingController(text: "01150261507");
  TextEditingController mailControler =
      TextEditingController(text: "ahhmedra3@gmail.com");
  TextEditingController passwordControler =
      TextEditingController(text: "001122@A");
  TextEditingController rePasswordControler =
      TextEditingController(text: "001122@A");
  var formKey = GlobalKey<FormState>();
  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.invoke(
          fullNameControler.text,
          mailControler.text,
          passwordControler.text,
          rePasswordControler.text,
          phoneControler.text);
      either.fold(
        (error) => emit(RegisterErrorState(failures: error)),
        (response) =>
            emit(RegisterSuccessState(registerResponseEntity: response)),
      );
    }
  }
}
