class GetFavoriteItemResponseEntity {
  GetFavoriteItemResponseEntity({
    this.status,
    this.count,
    this.data,
    this.message,
    this.statusMsg,
  });


  String? status;
  String? message;
  String? statusMsg;
  num? count;
  List<GetFavoriteDataEntity>? data;
}

class GetFavoriteDataEntity {
  GetFavoriteDataEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });


  num? sold;
  List<String>? images;
  List<GetFavoriteSubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  GetFavoriteCategoryEntity? category;
  GetFavoriteBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;
}

class GetFavoriteBrandEntity {
  GetFavoriteBrandEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });


  String? id;
  String? name;
  String? slug;
  String? image;
}

class GetFavoriteCategoryEntity {
  GetFavoriteCategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });


  String? id;
  String? name;
  String? slug;
  String? image;
}

class GetFavoriteSubcategoryEntity {
  GetFavoriteSubcategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });


  String? id;
  String? name;
  String? slug;
  String? category;
}
