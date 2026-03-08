

import 'package:bloc/bloc.dart';
import '../data/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{

  final NewsRepository repo;

  NewsBloc(this.repo):super(NewsInitialState()){



    //For top news
    on<FetchTopNews>((event, emit)async{
      emit(NewsLoadingState());

      try {
        final headlines = await repo.getTopNews();
        emit(NewsHeadLinesLoadedState(headlines));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });


    on<FetchSearchNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final searchResult = await repo.getSearchNews(event.query);
        emit(NewsSearchLoadedState(searchResult));
      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });


    ///Gor category news
    on<FetchCategoryNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final categories = await repo.getCategoryNews(event.category);
        emit(NewsCategoryLoadedState(categories));
      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });

  }

}