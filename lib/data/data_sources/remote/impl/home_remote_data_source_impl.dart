import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_endpoint.dart';
import 'package:e_commerece/core/api/api_manger.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/home_remote_data_source.dart';
import 'package:e_commerece/data/models/GetAllCategoryResponseOrBrandDm.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManger apiMAnger;
  HomeRemoteDataSourceImpl({required this.apiMAnger});

  @override
  //todo: هنا لازم يكون من نوع DM
  Future<Either<Failures, GetAllCategoryOrBrandResponseDm>>
      getCategory() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.getData(
          endPoint: ApiEndpoint.getAllCategory,
        );
        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        var categoryResponse =
            GetAllCategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: server ==> success
          return Right(categoryResponse);
        } else {
          //todo: server ==> failure
          return Left(ServerError(errorMessage: categoryResponse.message!));
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
  Future<Either<Failures, GetAllCategoryOrBrandResponseDm>> getBrand() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response = await apiMAnger.getData(
          endPoint: ApiEndpoint.getAllBrands,
        );
        print("RESPONSE Profile BODY: ${response.data}");
        print("STATUS Profile CODE: ${response.statusCode}");

        var brandResponse =
            GetAllCategoryOrBrandResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: server ==> success
          return Right(brandResponse);
        } else {
          //todo: server ==> failure
          return Left(ServerError(errorMessage: brandResponse.message!));
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
