
 ///Top HeadLine Api ( Slinding Window )

class SourceModel2{

  String? id;
  String? name;


  ///Constructor passing
  SourceModel2({this.id,this.name});

  factory SourceModel2.fromJson(Map<String, dynamic> json){
    return SourceModel2(
      id:json['id'],
      name:json['name'],
    );
  }
}


class ArticleModel{

  ///source model
  SourceModel2? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

   ArticleModel({
    this.author,
    this.title,
    this.description,
     this.url,
    this.urlToImage,
     this.publishedAt,
    this.source,
     this.content

});

   factory ArticleModel.fromJson(Map<String, dynamic> json){
     return ArticleModel(
       source:json['source'] != null
           ? SourceModel2.fromJson(json['source'])
           : null,

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


class HeadlineDataModel {
  String? status;
  int totalResults;
  List<ArticleModel> articles;

  HeadlineDataModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory HeadlineDataModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> getArticles = [];

    for (Map<String, dynamic> eachArticle in json['articles']) {
      getArticles.add(ArticleModel.fromJson(eachArticle));
    }

    return HeadlineDataModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: getArticles,
    );
  }
}

