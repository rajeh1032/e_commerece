import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/use_cases/add_item_favorite_use_case.dart';
import 'package:e_commerece/domain/use_cases/get_ItemFavorite_use_case.dart';

import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteTabViewModel extends Cubit<FavoriteTabStates> {
  AddItemFavoriteUseCase addItemFavoriteUseCase;
  GetItemfavoriteUseCase getItemfavoriteUseCase;
  FavoriteTabViewModel(
      {required this.addItemFavoriteUseCase,
      required this.getItemfavoriteUseCase})
      : super(GetFavoriteLoadingState());

  //todo: hold Data handle Logic

  static FavoriteTabViewModel get(context) =>
      BlocProvider.of<FavoriteTabViewModel>(context);
  List<GetFavoriteDataEntity> favoriteItemList = [];

  void getItemFavorite() async {
    emit(GetFavoriteLoadingState());
    var either = await getItemfavoriteUseCase.invoke();
    either.fold((error) {
      emit(GetFavoriteErrorState(failures: error));
    }, (response) {
      favoriteItemList = response.data!;
      print("mydata ${favoriteItemList.length}");
      emit(GetFavoriteSuccessState(getFavoriteItemResponseEntity: response));
    });
  }

  void addItemFavorite({required String productId}) async {
    emit(FavoriteLoadingState());
    var either = await addItemFavoriteUseCase.invoke(productId: productId);
    either.fold((error) {
      emit(FavoriteErrorState(failures: error));
    }, (response) {
      emit(FavoriteSuccessState(addItemFavoriteResponseEntity: response));
    });
  }
}
