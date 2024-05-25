class NewsModel {
  String title;
  String description;
  String url;
  String imageUrl;

  NewsModel({required this.title, required this.description, required this.url, required this.imageUrl});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageUrl: json['urlToImage'] as String,
    );
  }
}
