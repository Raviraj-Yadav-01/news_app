

import 'package:news_app/data/models/headlines_models.dart';
import '../../Bloc/news_event.dart';
import '../models/everything_model.dart';
import '../models/source_model.dart';
import '../service/api_service.dart';

class NewsRepository{
  final NewsApiService api;
  NewsRepository(this.api);

  Future<List<ArticleModel>> getTopNews() => api.fetchTopNews();

  Future<List<SourceModel>>getCategoryNews(String category) => api.fetchCategoryNews(category);

  Future<List<ArticleModel1>> getSearchNews(String query) => api.fetchSearchNews(query);

}