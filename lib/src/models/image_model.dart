class ImageModel {
  String id;
  Map urls;
  String description;

  ImageModel(this.id, this.urls, this.description);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    urls = parsedJson['urls'];
    description = parsedJson['description'];
  }
}
