import 'package:e_commerece/domain/entities/AddItemFavoriteResponseEntity.dart';

class AddItemFavoriteResponseDto extends AddItemFavoriteResponseEntity {
  AddItemFavoriteResponseDto({
    super.status,
    super.message,
    super.data,
    super.statusMsg,
  });

  AddItemFavoriteResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
