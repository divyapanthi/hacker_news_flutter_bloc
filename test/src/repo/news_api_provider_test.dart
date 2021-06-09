import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repo/news_api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('sum of 2 integers', (){
    final sum = 2 + 2;
    expect(sum, 4);
  });

  test('fetch top ids indeed returns a list of ids',() async {
    final data = "[ 9129911, 9129199, 9127761, 9128141, 9128264, 9127792 ]";

    final apiProvider = NewsApiProvider();
    apiProvider.client = MockClient((request) async{
      return Response(data, 200);
    });
    final ids = await apiProvider.fetchTopIds();
    expect(ids, [9129911, 9129199, 9127761, 9128141, 9128264, 9127792]);
  });

  // test('fetch top ids indeed returns a list of ids from the server',() async {
  //   final data = "[ 9129911, 9129199, 9127761, 9128141, 9128264, 9127792 ]";
  //
  //   final apiProvider = NewsApiProvider();
  //   final ids = await apiProvider.fetchTopIds();
  //   expect(ids is List<int>, true);
  // });

  test('fetch items indeed returns item model',() async {
    final data = """{
        "by" : "dhouston",
        "descendants" : 71,
        "id" : 8863,
        "kids" : [ 8952, 9224, 8917, 8884, 8887, 8943, 8869, 8958, 9005, 9671, 8940, 9067, 8908, 9055, 8865, 8881, 8872, 8873, 8955, 10403, 8903, 8928, 9125, 8998, 8901, 8902, 8907, 8894, 8878, 8870, 8980, 8934, 8876 ],
        "score" : 111,
        "time" : 1175714200,
        "title" : "My YC app: Dropbox - Throw away your USB drive",
        "type" : "story",
        "url" : "http://www.getdropbox.com/u/2/screencast.html"
  }""";

    final apiProvider = NewsApiProvider();
    apiProvider.client = MockClient((request) async{
      return Response(data, 200);
    });
    final item = await apiProvider.fetchItem(8863);
    expect(item!.descendants, 71 );
  });

  // test('fetch items indeed returns item model from server',() async {
  //   final apiProvider = NewsApiProvider();

  //   final item = await apiProvider.fetchItem(88863);

  //   expect(item!.score!, 104 );
  //   expect(item is ItemModel, true);
  //   expect(item.score is int, true);
  // });
}