

import 'package:bloc/bloc.dart';
import '../data/repositories/news_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{

  final NewsRepository repo;

  NewsBloc(this.repo):super(NewsInitialState()){

    on<FetchTopNews>((event, emit)async{
      emit(NewsLoadingState());

      try {
        final headlines = await repo.getTopNews();
        emit(NewsHeadLinesLoaded(headlines));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });


    on<FetchCategoryNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final categories = await repo.getCategoryNews(event.category);
        emit(NewsCategoryLoaded(categories));
      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });


    on<FetchSearchNews>((event, emit)async{
      emit(NewsLoadingState());
      try{
        final result = await repo.getSearchNews(event.query);
        emit(NewsSearchLoaded(result));
      }catch(errorMessage){
        emit(NewsError(errorMessage.toString()));
      }
    });

  }

}