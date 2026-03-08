/// Source Model
class SourceModel1 {
  String id;
  String name;

  SourceModel1({
    required this.id,
    required this.name,
  });

  factory SourceModel1.fromJson(Map<String, dynamic> json) {
    return SourceModel1(
      id: json['id'] ?? "null",
      name: json['name'] ?? "Unknown",
    );
  }
}

/// Article Model
class ArticleModel1 {
  String author;
  String content;
  String description;
  String publishedAt;
  SourceModel1 source;
  String title;
  String url;
  String urlToImage;

  ArticleModel1({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleModel1.fromJson(Map<String, dynamic> json) {
    return ArticleModel1(
      author: json['author'] ?? "Unknown",
      content: json['content'] ?? "",
      description: json['description'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      source: SourceModel1.fromJson(json['source'] ?? {}),
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ??
          "https://via.placeholder.com/300",
    );
  }
}

/// API Response Model
class EveryThingData {
  String status;
  int totalResults;
  List<ArticleModel1> articles1;

  EveryThingData({
    required this.status,
    required this.totalResults,
    required this.articles1,
  });

  factory EveryThingData.fromJson(Map<String, dynamic> json) {

    List<ArticleModel1> articlesList = [];

    if (json['articles'] != null) {
      articlesList = (json['articles'] as List)
          .map((e) => ArticleModel1.fromJson(e))
          .toList();
    }

    return EveryThingData(
      status: json['status'] ?? "",
      totalResults: json['totalResults'] ?? 0,
      articles1: articlesList,
    );
  }
}