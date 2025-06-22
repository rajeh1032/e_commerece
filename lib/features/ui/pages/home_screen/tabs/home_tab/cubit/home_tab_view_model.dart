import 'package:e_commerece/core/utils/app_assets.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';
import 'package:e_commerece/domain/use_cases/get_all_Brand_use_case.dart';
import 'package:e_commerece/domain/use_cases/get_all_category_use_case.dart';
import 'package:e_commerece/features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandUseCase getAllBrandUseCase;
  HomeTabViewModel(
      {required this.getAllCategoryUseCase, required this.getAllBrandUseCase})
      : super(HomeTabIntialState());
 
  //todo: hold Data handle Logic
  List<String> images = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3
  ];

  List<CategoryOrBrandDataEntity> categoriesList = [];
  void getAllCategory() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoryUseCase.invoke();
    either.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      categoriesList = response.data!;
      emit(CategorySuccessState(getAllCategoryResponseEntity: response));
    });
  }

  List<CategoryOrBrandDataEntity> brandList = [];

  void getAllBrand() async {
    emit(BrandLoadingState());
    var either = await getAllBrandUseCase.invoke();
    either.fold((error) {
      emit(BrandErrorState(failures: error));
    }, (response) {
      brandList = response.data!;
      emit(BrandSuccessState(getAllCategoryOrBrandResponseEntity: response));
    });
  }
}
