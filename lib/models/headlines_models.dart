///Top HeadLine Api
///
class SourceModel{
  String id;
  String name;

  SourceModel({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json){
    return SourceModel(
      id:json['id'],
      name:json['name'],
    );
  }

}


class ArticleModel{

  ///source model
  SourceModel source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

   ArticleModel({
    required this.author,
    required this.title,
    required this.description,
     required this.url,
     required this.urlToImage,
     required this.publishedAt,
     required this.content,
     required this.source

});

   factory ArticleModel.fromJson(Map<String, dynamic> json){
     return ArticleModel(
       source:json['source'],
       author:json['author'],
       title:json['title'],
       description:json['description'],
       url:json['url'],
       urlToImage:json['urlToImage'],
       publishedAt:json['publishedAt'],
       content:json['content'],
     );
   }

}


class TopHeadlineDataModel{
  String status;
  int totalResults;
  List<ArticleModel> articles;

  TopHeadlineDataModel({
    required this.status,
    required this.totalResults,
    required this.articles,
});

  factory TopHeadlineDataModel.fromJson(Map<String, dynamic> json){

  List<ArticleModel> getArticles = [];

  for(Map<String, dynamic> eachArticle in json['articles']){
  getArticles.add(ArticleModel.fromJson(eachArticle));
  }

  
    return TopHeadlineDataModel(
      status:json['status'],
      totalResults:json['totalResults'],
      articles:json['articles'],

    );
  }
}

