class ImageModel{

  String url;
  ImageModel(this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson){
    url = parsedJson['url'];
  }

}