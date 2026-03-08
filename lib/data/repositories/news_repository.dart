

import 'package:news_app/data/models/headlines_models.dart';
import '../models/everything_model.dart';
import '../models/source_model.dart';
import '../service/api_service.dart';

class NewsRepository{

  final NewsApiService api;

  NewsRepository(this.api);

  // //headlines news
  Future<List<ArticleModel>> getTopNews() => api.fetchTopNews();

  //search news
  Future<List<SourceModel>>getSearchNews(String query) => api.fetchSearchNews(query);

  //category news
  Future<List<ArticleModel1>> getCategoryNews(String category) => api.fetchCategoryNews(category);


}