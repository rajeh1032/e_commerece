import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/api/api_endpoint.dart';
import 'package:e_commerece/core/api/api_manger.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerece/data/models/RegisterResponseDm.dart';
import 'package:e_commerece/domain/entities/RegisterResponseEntity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManger apiMAnger;
  AuthRemoteDataSourceImpl({required this.apiMAnger});

  @override
  //todo: هنا لازم يكون من نوع DM
  Future<Either<Failures, RegisterResponseDm>> register(String name,
      String email, String password, String rePassword, String phone) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo:internet
        var response =
            await apiMAnger.postData(endPoint: ApiEndpoint.signUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        });
        var registerResponse = RegisterResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          //todo: server ==> success
          return Right(registerResponse);
        } else {
          //todo: server ==> failure
          return Left(ServerError(errorMessage: registerResponse.message!));
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
