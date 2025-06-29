import 'package:e_commerece/domain/entities/GetFavoriteItemResponseEntity.dart';

class GetFavoriteItemResponseDto extends GetFavoriteItemResponseEntity {
  GetFavoriteItemResponseDto({
    super.status,
    super.count,
    super.data,
    super.message,
    super.statusMsg,
  });

  GetFavoriteItemResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    count = json['count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetFavoriteDataDto.fromJson(v));
      });
    }
  }
}

class GetFavoriteDataDto extends GetFavoriteDataEntity {
  GetFavoriteDataDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
  });

  GetFavoriteDataDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(GetFavoriteSubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? GetFavoriteCategoryDto.fromJson(json['category'])
        : null;
    brand = json['brand'] != null
        ? GetFavoriteBrandDto.fromJson(json['brand'])
        : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    id = json['id'];
  }
}

class GetFavoriteBrandDto extends GetFavoriteBrandEntity {
  GetFavoriteBrandDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetFavoriteBrandDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetFavoriteCategoryDto extends GetFavoriteCategoryEntity {
  GetFavoriteCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  GetFavoriteCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class GetFavoriteSubcategoryDto extends GetFavoriteSubcategoryEntity {
  GetFavoriteSubcategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  GetFavoriteSubcategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
