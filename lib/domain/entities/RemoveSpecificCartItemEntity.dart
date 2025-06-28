class RemoveCartItemResponseEntity {
  RemoveCartItemResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
    this.message,
    this.statusMsg,
  });

  String? status;
  String? message;
  String? statusMsg;
  num? numOfCartItems;
  String? cartId;
  RemoveCartItemDataEntity? data;
}

class RemoveCartItemDataEntity {
  RemoveCartItemDataEntity({
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
  List<RemoveCartItemProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class RemoveCartItemProductsEntity {
  RemoveCartItemProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  RemoveCartItemProductEntity? product;
  num? price;
}

class RemoveCartItemProductEntity {
  RemoveCartItemProductEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<RemoveCartIteSubcategoryEntity>? subcategory;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  RemoveCartItemCategoryEntity? category;
  RemoveCartItemBrandEntity? brand;
  num? ratingsAverage;
}

class RemoveCartItemBrandEntity {
  RemoveCartItemBrandEntity({
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

class RemoveCartItemCategoryEntity {
  RemoveCartItemCategoryEntity({
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

class RemoveCartIteSubcategoryEntity {
  RemoveCartIteSubcategoryEntity({
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
