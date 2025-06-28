import 'package:e_commerece/domain/entities/RemoveSpecificCartItemEntity.dart';

class RemoveCartItemResponseDto extends RemoveCartItemResponseEntity {
  RemoveCartItemResponseDto(
      {super.status,
      super.numOfCartItems,
      super.cartId,
      super.data,
      super.message,
      super.statusMsg});

  RemoveCartItemResponseDto.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null
        ? RemoveCartItemDataDto.fromJson(json['data'])
        : null;
  }
}

class RemoveCartItemDataDto extends RemoveCartItemDataEntity {
  RemoveCartItemDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  RemoveCartItemDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(RemoveCartItemProductsDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class RemoveCartItemProductsDto extends RemoveCartItemProductsEntity {
  RemoveCartItemProductsDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  RemoveCartItemProductsDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? RemoveCartItemProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class RemoveCartItemProductDto extends RemoveCartItemProductEntity {
  RemoveCartItemProductDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  RemoveCartItemProductDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(RemoveCartIteSubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? RemoveCartItemCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? RemoveCartItemBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}

class RemoveCartItemBrandDto extends RemoveCartItemBrandEntity {
  RemoveCartItemBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  RemoveCartItemBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class RemoveCartItemCategoryDto extends RemoveCartItemCategoryEntity {
  RemoveCartItemCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  RemoveCartItemCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class RemoveCartIteSubcategoryDto extends RemoveCartIteSubcategoryEntity {
  RemoveCartIteSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  RemoveCartIteSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
