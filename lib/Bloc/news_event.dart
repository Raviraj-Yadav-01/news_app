
abstract class NewsEvent{

}

//top headlines
class FetchTopNews extends NewsEvent{

}

//search on tab event news
class FetchSearchNews extends NewsEvent{
  final String query;
  FetchSearchNews(this.query);
}

//category news
class FetchCategoryNews extends NewsEvent{
  final String category;
FetchCategoryNews(this.category);


}