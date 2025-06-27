import 'package:e_commerece/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto(
      {super.status,
      super.numOfCartItems,
      super.cartId,
      super.data,
      super.message,
      super.statusMsg});

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? GetCartDataDto.fromJson(json['data']) : null;
  }
}

class GetCartDataDto extends GetCartDataEntity {
  GetCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetCartProductsDto extends GetCartProductsEntity {
  GetCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetCartProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetCartProductDto extends GetCartProductEntity {
  GetCartProductDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetCartProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(GetCartSubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? GetCartCategoryDto.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? GetCartBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class GetCartBrandDto extends GetCartBrandEntity {
  GetCartBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetCartBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetCartCategoryDto extends GetCartCategoryEntity {
  GetCartCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetCartCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetCartSubcategoryDto extends GetCartSubcategoryEntity {
  GetCartSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  GetCartSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
