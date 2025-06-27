import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/use_cases/get_item_in_cart_use_case.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetItemInCartUseCase getItemInCartUseCase;

  CartScreenViewModel({required this.getItemInCartUseCase})
      : super(CartScreenLoadingState());

  //todo: hold Data handle Logic
  // static CartScreenViewModel get(context) =>
  //     BlocProvider.of<CartScreenViewModel>(context);
  List<GetCartProductsEntity> cartItems = [];
  void getCartItems() async {
    emit(CartScreenLoadingState());
    var either = await getItemInCartUseCase.invoke();
    either.fold((error) => emit(CartScreenErrorState(failures: error)),
        (response) {
      cartItems = response.data!.products!;
      emit(CartScreenSuccessState(getCartResponseEntity: response));
    });
  }
}
