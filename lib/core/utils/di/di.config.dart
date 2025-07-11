// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../data/data_sources/remote/auth_remote_data_source.dart'
    as _i930;
import '../../../data/data_sources/remote/cart_remote_data_source.dart'
    as _i419;
import '../../../data/data_sources/remote/favorite_remote_data_source.dart'
    as _i934;
import '../../../data/data_sources/remote/home_remote_data_source.dart'
    as _i382;
import '../../../data/data_sources/remote/impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../../data/data_sources/remote/impl/cart_remote_data_source_impl.dart'
    as _i296;
import '../../../data/data_sources/remote/impl/favorite_remote_data_source_impl.dart'
    as _i941;
import '../../../data/data_sources/remote/impl/home_remote_data_source_impl.dart'
    as _i727;
import '../../../data/repository/auth/auth_repository_impl.dart' as _i207;
import '../../../data/repository/cart/cart_reopsitory_impl.dart' as _i305;
import '../../../data/repository/favorite/favorite_repository_impl.dart'
    as _i339;
import '../../../data/repository/home/home_repository_impl.dart' as _i846;
import '../../../domain/repositories/auth/auth_repostiory.dart' as _i511;
import '../../../domain/repositories/cart/cart_reopsitory.dart' as _i197;
import '../../../domain/repositories/favorite/favorite_repository.dart'
    as _i1036;
import '../../../domain/repositories/home/home_repository.dart' as _i212;
import '../../../domain/use_cases/add_item_favorite_use_case.dart' as _i680;
import '../../../domain/use_cases/add_product_cart_use_case.dart' as _i451;
import '../../../domain/use_cases/get_all_Brand_use_case.dart' as _i116;
import '../../../domain/use_cases/get_all_category_use_case.dart' as _i563;
import '../../../domain/use_cases/get_item_in_cart_use_case.dart' as _i1056;
import '../../../domain/use_cases/get_ItemFavorite_use_case.dart' as _i776;
import '../../../domain/use_cases/get_products_use_case.dart' as _i697;
import '../../../domain/use_cases/login_use_case.dart' as _i798;
import '../../../domain/use_cases/register_use_case.dart' as _i311;
import '../../../domain/use_cases/remove_item_favorite_use_case.dart' as _i662;
import '../../../domain/use_cases/removeCartItemUseCase.dart' as _i377;
import '../../../domain/use_cases/upddate_cart_item_use_case.dart' as _i267;
import '../../../features/cart_screen/cubit/cart_screen_view_model.dart'
    as _i698;
import '../../../features/ui/auth/login/cubit/login_view_model.dart' as _i51;
import '../../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i504;
import '../../../features/ui/pages/home_screen/cubit/home_screen_view_model.dart'
    as _i543;
import '../../../features/ui/pages/home_screen/tabs/favorite_tab/cubit/favorite_tab_view_model.dart'
    as _i328;
import '../../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i1013;
import '../../../features/ui/pages/home_screen/tabs/product_tab/cubit/product_tab_view_model.dart'
    as _i117;
import '../../api/api_manger.dart' as _i254;
import '../cache/hive_utils.dart' as _i790;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i543.HomeScreenViewModel>(() => _i543.HomeScreenViewModel());
    gh.singleton<_i254.ApiManger>(() => _i254.ApiManger());
    gh.singleton<_i790.HiveUtils>(() => _i790.HiveUtils());
    gh.factory<_i419.CartRemoteDataSource>(
        () => _i296.CartRemoteDataSourceImpl(apiMAnger: gh<_i254.ApiManger>()));
    gh.factory<_i930.AuthRemoteDataSource>(
        () => _i758.AuthRemoteDataSourceImpl(apiMAnger: gh<_i254.ApiManger>()));
    gh.factory<_i934.FavoriteRemoteDataSource>(() =>
        _i941.FavoriteRemoteDataSourceImpl(apiMAnger: gh<_i254.ApiManger>()));
    gh.factory<_i382.HomeRemoteDataSource>(
        () => _i727.HomeRemoteDataSourceImpl(apiMAnger: gh<_i254.ApiManger>()));
    gh.factory<_i1036.FavoriteRepository>(() => _i339.FavoriteRepositoryImpl(
        favoriteRemoteDataSource: gh<_i934.FavoriteRemoteDataSource>()));
    gh.factory<_i511.AuthRepository>(() => _i207.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i930.AuthRemoteDataSource>()));
    gh.factory<_i197.CartRepository>(
        () => _i305.CartRepositoryImpl(gh<_i419.CartRemoteDataSource>()));
    gh.factory<_i212.HomeRepository>(
        () => _i846.HomeRepositoryImpl(gh<_i382.HomeRemoteDataSource>()));
    gh.factory<_i798.LoginUseCase>(
        () => _i798.LoginUseCase(authRepository: gh<_i511.AuthRepository>()));
    gh.factory<_i311.RegisterUseCase>(() =>
        _i311.RegisterUseCase(authRepository: gh<_i511.AuthRepository>()));
    gh.factory<_i451.AddProductCartUseCase>(() => _i451.AddProductCartUseCase(
        homeRepository: gh<_i212.HomeRepository>()));
    gh.factory<_i116.GetAllBrandUseCase>(() =>
        _i116.GetAllBrandUseCase(homeRepository: gh<_i212.HomeRepository>()));
    gh.factory<_i563.GetAllCategoryUseCase>(() => _i563.GetAllCategoryUseCase(
        homeRepository: gh<_i212.HomeRepository>()));
    gh.factory<_i697.GetProductsUseCase>(() =>
        _i697.GetProductsUseCase(homeRepository: gh<_i212.HomeRepository>()));
    gh.factory<_i377.Removecartitemusecase>(() => _i377.Removecartitemusecase(
        cartRepository: gh<_i197.CartRepository>()));
    gh.factory<_i267.UpdateCartItemUseCase>(() => _i267.UpdateCartItemUseCase(
        cartRepository: gh<_i197.CartRepository>()));
    gh.factory<_i504.RegisterViewModel>(() =>
        _i504.RegisterViewModel(registerUseCase: gh<_i311.RegisterUseCase>()));
    gh.factory<_i1056.GetItemInCartUseCase>(() => _i1056.GetItemInCartUseCase(
        cartReopsitory: gh<_i197.CartRepository>()));
    gh.factory<_i51.LoginViewModel>(
        () => _i51.LoginViewModel(loginUseCase: gh<_i798.LoginUseCase>()));
    gh.factory<_i680.AddItemFavoriteUseCase>(() => _i680.AddItemFavoriteUseCase(
        favoriteRepository: gh<_i1036.FavoriteRepository>()));
    gh.factory<_i776.GetItemfavoriteUseCase>(() => _i776.GetItemfavoriteUseCase(
        favoriteRepository: gh<_i1036.FavoriteRepository>()));
    gh.factory<_i662.RemoveItemFavoriteUseCase>(() =>
        _i662.RemoveItemFavoriteUseCase(
            favoriteRepository: gh<_i1036.FavoriteRepository>()));
    gh.factory<_i117.ProductTabViewModel>(() => _i117.ProductTabViewModel(
          getProductsUseCase: gh<_i697.GetProductsUseCase>(),
          addProductCartUseCase: gh<_i451.AddProductCartUseCase>(),
        ));
    gh.factory<_i328.FavoriteTabViewModel>(() => _i328.FavoriteTabViewModel(
          addItemFavoriteUseCase: gh<_i680.AddItemFavoriteUseCase>(),
          getItemfavoriteUseCase: gh<_i776.GetItemfavoriteUseCase>(),
          removeItemFavoriteUseCase: gh<_i662.RemoveItemFavoriteUseCase>(),
          hiveUtils: gh<_i790.HiveUtils>(),
        ));
    gh.factory<_i1013.HomeTabViewModel>(() => _i1013.HomeTabViewModel(
          getAllCategoryUseCase: gh<_i563.GetAllCategoryUseCase>(),
          getAllBrandUseCase: gh<_i116.GetAllBrandUseCase>(),
        ));
    gh.factory<_i698.CartScreenViewModel>(() => _i698.CartScreenViewModel(
          getItemInCartUseCase: gh<_i1056.GetItemInCartUseCase>(),
          removecartitemusecase: gh<_i377.Removecartitemusecase>(),
          updateCartItemUseCase: gh<_i267.UpdateCartItemUseCase>(),
        ));
    return this;
  }
}
