import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerece/domain/use_cases/get_item_in_cart_use_case.dart';
import 'package:e_commerece/domain/use_cases/removeCartItemUseCase.dart';
import 'package:e_commerece/domain/use_cases/upddate_cart_item_use_case.dart';
import 'package:e_commerece/features/cart_screen/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartScreenViewModel extends Cubit<CartScreenStates> {
  GetItemInCartUseCase getItemInCartUseCase;
  Removecartitemusecase removecartitemusecase;
  UpdateCartItemUseCase updateCartItemUseCase;

  CartScreenViewModel(
      {required this.getItemInCartUseCase,
      required this.removecartitemusecase,
      required this.updateCartItemUseCase})
      : super(CartScreenLoadingState());

  //todo: hold Data handle Logic
  static CartScreenViewModel get(context) =>
      BlocProvider.of<CartScreenViewModel>(context);
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

  void removeCartItem({required String productId}) async {
    emit(RemoveCartItemLoadingState());
    var either = await removecartitemusecase.invoke(productId: productId);
    either.fold((error) => emit(RemoveCartItemErrorState(failures: error)),
        (response) {
      getCartItems();
      emit(RemoveCartItemSuccessState(removeCartItemResponseEntity: response));
    });
  }

  void updateCartItem(
      {required String productId, required String count}) async {
    emit(UpdateCartItemLoadingState());
    var either =
        await updateCartItemUseCase.invoke(productId: productId, count: count);
    either.fold((error) => emit(UpdateCartItemErrorState(failures: error)),
        (response) {
      getCartItems();
      emit(UpdateCartItemSuccessState(updateCartItemResponseEntity: response));
    });
  }
}
