import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repo/news_api_provider.dart';
import 'package:hacker_news/src/repo/news_db_provider.dart';

class Repository {
  final NewsDbProvider dbProvider = NewsDbProvider();
  final NewsApiProvider apiProvider = NewsApiProvider();

  Future<List<int>> fetchTopIds() async {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel?> fetchItem(int id) async {
    ItemModel? item = await dbProvider.fetchItem(id);
    if(item != null) return item;
    item = await apiProvider.fetchItem(id);

    if(item!=null){
      dbProvider.insertItem(item);
    }
    return item;

  }

}


