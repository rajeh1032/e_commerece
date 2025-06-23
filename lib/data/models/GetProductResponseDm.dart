import 'package:e_commerece/domain/entities/GetProductResponseEntity.dart';

class GetProductResponseDm extends GetProductResponseEntity {
  GetProductResponseDm(
      {super.results, super.metadata, super.data, super.message});

  GetProductResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];

    metadata = json['metadata'] != null
        ? ProductMetadataDm.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDataDm.fromJson(v));
      });
    }
  }
}

class ProductDataDm extends ProductDataEntity {
  ProductDataDm({
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
  });

  ProductDataDm.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(ProductSubcategoryDm.fromJson(v));
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
        ? ProductCategoryDm.fromJson(json['category'])
        : null;
    brand =
        json['brand'] != null ? ProductBrandDm.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
}

class ProductBrandDm extends ProductBrandEntity {
  ProductBrandDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  ProductBrandDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductCategoryDm extends ProductCategoryEntity {
  ProductCategoryDm({
    super.id,
    super.name,
    super.slug,
    super.image,
  });

  ProductCategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }
}

class ProductSubcategoryDm extends ProductSubcategoryEntity {
  ProductSubcategoryDm({
    super.id,
    super.name,
    super.slug,
    super.category,
  });

  ProductSubcategoryDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}

class ProductMetadataDm extends ProductMetadataEntity {
  ProductMetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
    super.nextPage,
  });

  ProductMetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}
