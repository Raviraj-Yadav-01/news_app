
abstract class NewsEvent{}


class FetchTopNews extends NewsEvent{
}

class FetchCategoryNews extends NewsEvent{
  final String category;
  FetchCategoryNews(this.category);
}

class FetchSearchNews extends NewsEvent{
  final String query;
FetchSearchNews(this.query);
}