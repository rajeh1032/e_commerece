class GetAllCategoryOrBrandResponseEntity {
  GetAllCategoryOrBrandResponseEntity({
    this.results,
    this.metadata,
    this.data,
    this.statusMsg,
    this.message,
  });
  String? statusMsg;
  String? message;
  int? results;
  MetadataEntity? metadata;
  List<CategoryOrBrandDataEntity>? data;
}

class CategoryOrBrandDataEntity {
  CategoryOrBrandDataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
}

class MetadataEntity {
  MetadataEntity({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  int? currentPage;
  int? numberOfPages;
  int? limit;
}
