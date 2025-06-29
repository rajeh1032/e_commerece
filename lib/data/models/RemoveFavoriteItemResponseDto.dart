import 'package:e_commerece/domain/entities/RemoveFavoriteItemResponseEntity.dart';

class RemoveFavoriteItemDto extends RemoveFavoriteItemEntity {
  RemoveFavoriteItemDto(
      {super.status, super.message, super.data, super.statusMsg});

  RemoveFavoriteItemDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];

    data = json['data'] != null ? json['data'].cast<String>() : [];
  }
}
