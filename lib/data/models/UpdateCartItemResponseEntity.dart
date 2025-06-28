import 'package:e_commerece/domain/entities/UpdateCartItemResponseEntity.dart';

class UpdateCartItemResponseDto extends UpdateCartItemResponseEntity {
  UpdateCartItemResponseDto({
    super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,
    super.message,
    super.statusMsg,
  });

  UpdateCartItemResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data =
        json['data'] != null ? UpdateCartDataDto.fromJson(json['data']) : null;
  }
}

class UpdateCartDataDto extends UpdateCartDataEntity {
  UpdateCartDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  UpdateCartDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(UpdateCartProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class UpdateCartProductsDto extends UpdateCartProductsEntity {
  UpdateCartProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  UpdateCartProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? UpdateCartProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class UpdateCartProductDto extends UpdateCartProductEntity {
  UpdateCartProductDto({
    super.subcategory,
    super.id,
    super.title,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  UpdateCartProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(UpdateCartSubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? UpdateCartCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? UpdateCartBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class UpdateCartBrandDto extends UpdateCartBrandEntity {
  UpdateCartBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  UpdateCartBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class UpdateCartCategoryDto extends UpdateCartCategoryEntity {
  UpdateCartCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  UpdateCartCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class UpdateCartSubcategoryDto extends UpdateCartSubcategoryEntity {
  UpdateCartSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  UpdateCartSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
