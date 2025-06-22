import 'package:e_commerece/domain/entities/get_all_category_or_brand_response_entity.dart';

class GetAllCategoryOrBrandResponseDm
    extends GetAllCategoryOrBrandResponseEntity {
  GetAllCategoryOrBrandResponseDm({
    super.results,
    super.metadata,
    super.data,
    super.message,
    super.statusMsg,
  });

  GetAllCategoryOrBrandResponseDm.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    metadata =
        json['metadata'] != null ? MetadataDm.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = (json['data'] as List)
          .map((e) => CategoryOrBrandDataDm.fromJson(e))
          .toList();
    }
  }
}

class CategoryOrBrandDataDm extends CategoryOrBrandDataEntity {
  CategoryOrBrandDataDm({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  CategoryOrBrandDataDm.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class MetadataDm extends MetadataEntity {
  MetadataDm({
    super.currentPage,
    super.numberOfPages,
    super.limit,
  });

  MetadataDm.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
