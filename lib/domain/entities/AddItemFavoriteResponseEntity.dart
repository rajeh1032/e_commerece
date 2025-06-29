class AddItemFavoriteResponseEntity {
  AddItemFavoriteResponseEntity(
      {this.status, this.message, this.data, this.statusMsg});

  String? status;
  String? message;
  String? statusMsg;

  List<String>? data;
}
