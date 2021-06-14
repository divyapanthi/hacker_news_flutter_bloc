import 'package:bloc/bloc.dart';
import 'package:hacker_news/src/bloc/news/news_event.dart';
import 'package:hacker_news/src/bloc/news/news_state.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repo/repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{

  final Repository repo;
  NewsBloc(this.repo) : super(NewsState(status: NewsStatus.initial));
  @override

  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if(event is FetchStoriesEvent){
      yield(NewsState(status:  NewsStatus.loading));
      final ids = await repo.fetchTopIds();
      if(ids.isEmpty){
        yield(NewsState(
            status: NewsStatus.error,
            message: "Could not fetch news, please try again"));
      }else{
        yield(NewsState(status: NewsStatus.loaded, ids: ids));
      }
      //todo fetch events and return it
    }
    if(event is RefreshEvent){
      // todo handle later
    }
  }

  Future<ItemModel?> getItemById(int id) async {
    return repo.fetchItem(id);
  }

}