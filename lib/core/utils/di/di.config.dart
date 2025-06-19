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
import '../../../data/data_sources/remote/impl/auth_remote_data_source_impl.dart'
    as _i758;
import '../../../data/repository/auth/auth_repository_impl.dart' as _i207;
import '../../../domain/repositories/auth/auth_repostiory.dart' as _i511;
import '../../../domain/use_cases/login_use_case.dart' as _i798;
import '../../../domain/use_cases/register_use_case.dart' as _i311;
import '../../../features/ui/auth/login/cubit/login_view_model.dart' as _i51;
import '../../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i504;
import '../../api/api_manger.dart' as _i254;

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
    gh.singleton<_i254.ApiManger>(() => _i254.ApiManger());
    gh.factory<_i930.AuthRemoteDataSource>(
        () => _i758.AuthRemoteDataSourceImpl(apiMAnger: gh<_i254.ApiManger>()));
    gh.factory<_i511.AuthRepository>(() => _i207.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i930.AuthRemoteDataSource>()));
    gh.factory<_i311.RegisterUseCase>(() =>
        _i311.RegisterUseCase(authRepository: gh<_i511.AuthRepository>()));
    gh.factory<_i798.LoginUseCase>(
        () => _i798.LoginUseCase(authRepository: gh<_i511.AuthRepository>()));
    gh.factory<_i504.RegisterViewModel>(() =>
        _i504.RegisterViewModel(registerUseCase: gh<_i311.RegisterUseCase>()));
    gh.factory<_i51.LoginViewModel>(
        () => _i51.LoginViewModel(loginUseCase: gh<_i798.LoginUseCase>()));
    return this;
  }
}
