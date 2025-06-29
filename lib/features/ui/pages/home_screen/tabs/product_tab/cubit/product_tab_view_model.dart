import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';
import 'package:e_commerece/domain/use_cases/add_product_cart_use_case.dart';

import 'package:e_commerece/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  GetProductsUseCase getProductsUseCase;
  AddProductCartUseCase addProductCartUseCase;

  ProductTabViewModel(
      {required this.getProductsUseCase, required this.addProductCartUseCase})
      : super(ProductLoadingState());

  //todo: hold Data handle Logic

  static ProductTabViewModel get(context) =>
      BlocProvider.of<ProductTabViewModel>(context);

  List<ProductDataEntity> productList = [];
  void getProducts() async {
    emit(ProductLoadingState());
    var either = await getProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductErrorState(failures: error));
    }, (response) {
      productList = response.data!;
      emit(ProductSuccessState(getProductResponseEntity: response));
    });
  }

  int cartCounter = 0;
  void addToCart({required String productId}) async {
    // emit(AddCarLoadingState());
    var either = await addProductCartUseCase.invoke(productId: productId);
    either.fold((error) {
      emit(AddCarErrorState(failures: error));
    }, (response) {
      cartCounter = response.numOfCartItems!.toInt();
      emit(AddCarSuccessState(addCartResponseEntity: response));
    });
  }
}
