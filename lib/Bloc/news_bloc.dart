

import 'package:bloc/bloc.dart';
import '../data/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{

  final NewsRepository apiService;

  NewsBloc(this.apiService):super(NewsInitialState()){



    //For top news
    on<FetchTopNews>((event, emit)async{
      emit(NewsLoadingState());

      try {
        final headlines = await apiService.getTopNews();
        emit(NewsHeadLinesLoadedState(headlines));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });



    ///Search
    on<FetchSearchNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final response = await apiService.getSearchNews(event.query);

        emit(NewsSearchLoadedState(response));

      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });



    ///for category news
    on<FetchCategoryNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final categories = await apiService.getCategoryNews(event.category);
        emit(NewsCategoryLoadedState(categories));
      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });

  }

}

