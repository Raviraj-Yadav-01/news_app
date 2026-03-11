import 'package:news_app/data/models/headlines_models.dart';

import '../data/models/everything_model.dart';
import '../data/models/source_model.dart';

abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadingState extends NewsState {}

///for Headlines news
class NewsHeadLinesLoadedState extends NewsState {
  final List<ArticleModel> headlines;
  NewsHeadLinesLoadedState(this.headlines);
}


/// Used for Category News
class NewsCategoryLoadedState extends NewsState {
  final List<ArticleModel1> categories;
  NewsCategoryLoadedState(this.categories);
}


/// Used for Search News
class NewsSearchLoadedState extends NewsState {
  final List<ArticleModel1> searchResult;
  NewsSearchLoadedState(this.searchResult);
}


//for errors
class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}
