import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/everything_model.dart';
import '../models/headlines_models.dart';
import '../models/source_model.dart';

class NewsApiService {

  /// for Top HeadLines
  Future<List<ArticleModel>> fetchTopNews() async {
    final url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=010d2329efdb4769a7840d2f953ad535";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final mData = jsonDecode(response.body);
      return HeadlineDataModel.fromJson(mData).articles;
    } else {
      throw Exception("Failed to load headlines");
    }
  }

  ///Category news
  Future<List<ArticleModel1>> fetchCategoryNews(String category) async {
    String url2 = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=010d2329efdb4769a7840d2f953ad535";
    var response2 = await http.get(Uri.parse(url2));

    if (response2.statusCode == 200) {
      var category = jsonDecode(response2.body);
      return EveryThingData.fromJson(category).articles1;
    } else {
      throw Exception("Failed to Search News");
    }
  }


  ///For search News
  Future<List<SourceModel>> fetchSearchNews(String query) async {
    String url1 = "https://newsapi.org/v2/top-headlines/sources?apiKey=010d2329efdb4769a7840d2f953ad535";
    var response1 = await http.get(Uri.parse(url1));

    if (response1.statusCode == 200) {
      var searchData = jsonDecode(response1.body);
      return SourceDataModel.fromJson(searchData).sources;
    } else {
      throw Exception("Failed to load categories");
    }
  }


}
