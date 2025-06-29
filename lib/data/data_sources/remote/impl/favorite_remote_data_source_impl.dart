import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_endpoint.dart';
import 'package:e_commerece/core/api/api_manger.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:e_commerece/data/data_sources/remote/favorite_remote_data_source.dart';
import 'package:e_commerece/data/models/AddItemFavoriteResponseDto.dart';
import 'package:e_commerece/data/models/GetFavoriteItemResponseDto.dart';
import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';
import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoriteRemoteDataSource)
class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  ApiManger apiMAnger;
  FavoriteRemoteDataSourceImpl({required this.apiMAnger});

  @override
  Future<Either<Failures, AddItemFavoriteResponseDto>> addItemFavorite(
      {required String productId}) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      var token = SharedPreferenceUtils.getData(key: 'token');

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.postData(
          endPoint: ApiEndpoint.favoriteItem,
          headers: {'token': token},
          body: {"productId": productId},
        );

        var cartResponse = AddItemFavoriteResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: server ==> success
          return Right(cartResponse);
        } else {
          //todo: server ==> failure
          return Left(ServerError(errorMessage: cartResponse.message!));
        }
      } else {
        //todo:no internet
        return Left(NetworkError(errorMessage: "No internet connection"));
      }
    } catch (e) {
      //todo: error
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetFavoriteItemResponseDto>> getItemFavorite() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      var token = SharedPreferenceUtils.getData(key: 'token');

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.getData(
          endPoint: ApiEndpoint.favoriteItem,
          headers: {'token': token},
        );

        var cartResponse = GetFavoriteItemResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: server ==> success
          return Right(cartResponse);
        } else {
          //todo: server ==> failure
          return Left(ServerError(errorMessage: cartResponse.message!));
        }
      } else {
        //todo:no internet
        return Left(NetworkError(errorMessage: "No internet connection"));
      }
    } catch (e) {
      //todo: error
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
