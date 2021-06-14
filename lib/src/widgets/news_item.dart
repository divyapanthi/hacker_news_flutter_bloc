import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/widgets/loading_container.dart';

class NewsItem extends StatelessWidget {
  final Future<ItemModel?> item;

  const NewsItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: item,
        builder: (context, AsyncSnapshot<ItemModel?> snapshot) {
          if (!snapshot.hasData) {
            return LoadingContainer();
          }
          final data = snapshot.data;
          if (data == null) {
            return LoadingContainer();
          }

          return Column(
            children: [
              ListTile(
                title: Text(data.title!),
                subtitle: Text("${data.score} votes"),
                trailing: Column(
                  children: [
                    Icon(Icons.comment),
                    Text("${data.kids!.length}"),
                  ],
                ),
              ),
            ],
          );
        }
    );
  }
  }
