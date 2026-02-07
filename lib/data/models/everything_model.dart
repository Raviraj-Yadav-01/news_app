
///source model
class SourceModel1{

  String id;
  String name;

  SourceModel1({required this.id, required this.name});

  factory SourceModel1.fromJson(Map<String, dynamic> json){
    return SourceModel1(
      id:json['id'],
    name:json['name'],
    );
  }
}


class ArticleModel1{
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


  factory ArticleModel1.fromJson(Map<String, dynamic> json){
    return ArticleModel1(
      author:json['author'],
      content:json['content'],
      description:json['description'],
      publishedAt:json['publishedAt'],
      source:json['source'],
      title:json['title'],
      url:json['url'],
      urlToImage:json['urlToImage']
    );
  }
}


class EveryThingData{
  String status;
  int totalResults;
  List<ArticleModel1> articles;

  EveryThingData({
    required this.status,
    required this.totalResults,
    required this.articles,
});

  factory EveryThingData.fromJson(Map<String, dynamic>json){

    List<EveryThingData> mArticles = [];

    for(Map<String, dynamic> article in json['articles']){
    mArticles.add(EveryThingData.fromJson(article));
    }

    return EveryThingData(
      status:json['status'],
      totalResults:json['totalResults'],
      articles:json['articles'],

    );

  }

}