import 'package:e_commerece/domain/entities/AddCartResponseEntity.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  AddCartResponseDto(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
      super.statusMsg});

  AddCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddCartDataDto.fromJson(json['data']) : null;
  }
}

class AddCartDataDto extends AddCartDataEntity {
  AddCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductsDto extends AddProductsEntity {
  AddProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
