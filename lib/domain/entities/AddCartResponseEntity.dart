class AddCartResponseEntity {
  AddCartResponseEntity(
      {this.status,
      this.message,
      this.numOfCartItems,
      this.cartId,
      this.data,
      this.statusMsg});

  String? status;
  String? message;
  String? statusMsg;

  num? numOfCartItems;
  String? cartId;
  AddCartDataEntity? data;
}

class AddCartDataEntity {
  AddCartDataEntity({
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
  List<AddProductsEntity>? products;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;
}

class AddProductsEntity {
  AddProductsEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  num? count;
  String? id;
  String? product;
  num? price;
}
