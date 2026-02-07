import 'package:news_app/data/models/headlines_models.dart';

import '../data/models/everything_model.dart';
import '../data/models/source_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

///for Headlines news
class NewsHeadLinesLoaded extends NewsState {
  final List<ArticleModel> headlines;
  NewsHeadLinesLoaded(this.headlines);
}

/// Used for Category News
class NewsCategoryLoaded extends NewsState {
  final List<SourceModel> categories;
  NewsCategoryLoaded(this.categories);
}

/// Used for Search News
class NewsSearchLoaded extends NewsState {
  final List<ArticleModel1> searchResult;
  NewsSearchLoaded(this.searchResult);
}

//for errors
class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}
