import 'dart:convert';

import 'package:hacker_news/src/models/item_model.dart';
import 'package:http/http.dart';

class NewsApiProvider{
  Client client= Client();

  Future<List<int>> fetchTopIds() async {
    final uri = Uri.parse("https://hacker-news.firebaseio.com/v0/topstories.json");
    try{
      final response = await client.get(uri);
      final body = jsonDecode(response.body) as List;
      print("The top ids $body");
      return body.cast<int>();

    }catch(e){
      print("Exception getting ids $e");
      return [];
    }
  }

  Future<ItemModel?> fetchItem(int id) async {
    final uri = Uri.parse("https://hacker-news.firebaseio.com/v0/item/$id.json");
    try{
      final response = await client.get(uri);
      final body = jsonDecode(response.body);
      print("Response is $body");
      final item = ItemModel.fromJson(body);
      return item;
    }catch(e){
      print("Item model exception $e");
      return null;
    }
  }


}