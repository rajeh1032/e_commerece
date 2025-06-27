class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
    this.message,
    this.statusMsg,
  });

  String? status;
  num? numOfCartItems;
  String? cartId;
  GetCartDataEntity? data;
  String? message;
  String? statusMsg;
}

class GetCartDataEntity {
  GetCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetCartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class GetCartProductsEntity {
  GetCartProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  GetCartProductEntity? product;
  num? price;
}

class GetCartProductEntity {
  GetCartProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<GetCartSubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  GetCartCategoryEntity? category;
  GetCartBrandEntity? brand;
  num? ratingsAverage;
}

class GetCartBrandEntity {
  GetCartBrandEntity({
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

class GetCartCategoryEntity {
  GetCartCategoryEntity({
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

class GetCartSubcategoryEntity {
  GetCartSubcategoryEntity({
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
