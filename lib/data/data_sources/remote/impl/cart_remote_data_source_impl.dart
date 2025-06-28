import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_endpoint.dart';
import 'package:e_commerece/core/api/api_manger.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/core/utils/cache/shared_preference_utils.dart';
import 'package:e_commerece/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:e_commerece/data/models/GetCartResponseDto.dart';
import 'package:e_commerece/data/models/RemoveSpecificCartItemDto.dart';
import 'package:e_commerece/data/models/UpdateCartItemResponseEntity.dart';
import 'package:e_commerece/domain/entities/UpdateCartItemResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManger apiMAnger;
  CartRemoteDataSourceImpl({required this.apiMAnger});

  @override
  Future<Either<Failures, GetCartResponseDto>> getItemInCart() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      var token = SharedPreferenceUtils.getData(key: 'token');

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.getData(
            endPoint: ApiEndpoint.getItemCart, headers: {'token': token});
        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        var cartResponse = GetCartResponseDto.fromJson(response.data);
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
  Future<Either<Failures, RemoveCartItemResponseDto>> removeCartItem(
      {String? productId}) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      var token = SharedPreferenceUtils.getData(key: 'token');

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.deleteData(
          endPoint: '${ApiEndpoint.getItemCart}/${productId}',
          headers: {'token': token},
        );
        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        var cartResponse = RemoveCartItemResponseDto.fromJson(response.data);
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
  Future<Either<Failures, UpdateCartItemResponseDto>> updateCartItem(
      {required String productId, required String count}) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      var token = SharedPreferenceUtils.getData(key: 'token');

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.updateData(
          endPoint: '${ApiEndpoint.getItemCart}/${productId}',
          headers: {'token': token},
          body: {"count": count},
        );
       
        var cartResponse = UpdateCartItemResponseDto.fromJson(response.data);
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
