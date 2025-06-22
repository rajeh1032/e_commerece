import 'package:dartz/dartz.dart';
import 'package:e_commerece/core/errors/failures.dart';
import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';
import 'package:e_commerece/domain/repositories/home/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoryUseCase {
  HomeRepository homeRepository;
  GetAllCategoryUseCase({required this.homeRepository});

  Future<Either<Failures, GetAllCategoryOrBrandResponseEntity>> invoke() {
    return homeRepository.getCategory();
  }
}
