import 'package:e_commerece/core/utils/cache/hive_utils.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:e_commerece/domain/use_cases/add_item_favorite_use_case.dart';
import 'package:e_commerece/domain/use_cases/get_ItemFavorite_use_case.dart';
import 'package:e_commerece/domain/use_cases/remove_item_favorite_use_case.dart';

import 'package:e_commerece/features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteTabViewModel extends Cubit<FavoriteTabStates> {
  AddItemFavoriteUseCase addItemFavoriteUseCase;
  GetItemfavoriteUseCase getItemfavoriteUseCase;
  RemoveItemFavoriteUseCase removeItemFavoriteUseCase;
  final HiveUtils hiveUtils;
  FavoriteTabViewModel(
      {required this.addItemFavoriteUseCase,
      required this.getItemfavoriteUseCase,
      required this.removeItemFavoriteUseCase,
      required this.hiveUtils})
      : super(GetFavoriteLoadingState());

  //todo: hold Data handle Logic

  static FavoriteTabViewModel get(context) =>
      BlocProvider.of<FavoriteTabViewModel>(context);
  List<GetFavoriteDataEntity> favoriteItemList = [];

  Future<void> getItemFavorite() async {
    emit(GetFavoriteLoadingState());
    var either = await getItemfavoriteUseCase.invoke();
    either.fold((error) {
      emit(GetFavoriteErrorState(failures: error));
    }, (response) {
      favoriteItemList = response.data!;
      emit(GetFavoriteSuccessState(getFavoriteItemResponseEntity: response));
    });
  }

  Future<void> addItemFavorite({required String productId}) async {
    emit(FavoriteLoadingState());
    var either = await addItemFavoriteUseCase.invoke(productId: productId);
    either.fold((error) {
      emit(FavoriteErrorState(failures: error));
    }, (response) async {
      await hiveUtils.saveFavorite(productId);
      emit(FavoriteSuccessState(addItemFavoriteResponseEntity: response));
    });
  }

  Future<void> removeItemFavorite({required String productId}) async {
    emit(RemoveItemFavoriteLoadingState());
    var either = await removeItemFavoriteUseCase.invoke(productId: productId);
    either.fold((error) {
      emit(RemoveItemFavoriteErrorState(failures: error));
    }, (response) async {
      await hiveUtils.removeFavorite(productId);
      emit(RemoveItemFavoriteSuccessState(removeFavoriteItemEntity: response));
    });
  }
}
