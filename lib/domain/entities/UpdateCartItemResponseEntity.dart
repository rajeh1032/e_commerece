class UpdateCartItemResponseEntity {
  UpdateCartItemResponseEntity({
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
  String? message;
  String? statusMsg;
  UpdateCartDataEntity? data;
}

class UpdateCartDataEntity {
  UpdateCartDataEntity({
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
  List<UpdateCartProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class UpdateCartProductsEntity {
  UpdateCartProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });
  num? count;
  String? id;
  UpdateCartProductEntity? product;
  num? price;
}

class UpdateCartProductEntity {
  UpdateCartProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<UpdateCartSubcategoryEntity>? subcategory;
  String? id;
  String? title;
  String? imageCover;
  UpdateCartCategoryEntity? category;
  UpdateCartBrandEntity? brand;
  num? ratingsAverage;
}

class UpdateCartBrandEntity {
  UpdateCartBrandEntity({
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

class UpdateCartCategoryEntity {
  UpdateCartCategoryEntity({
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

class UpdateCartSubcategoryEntity {
  UpdateCartSubcategoryEntity({
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
