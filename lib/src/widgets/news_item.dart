import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/screens/comment_screen.dart';
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
            return Container();
          }

          return Column(
            children: [
              Card(
                child: ListTile(
                  onTap: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context){
                          return CommentScreen(item:data);
                    }));
                  },
                  title: Text(data.title!),
                  subtitle: Text("${data.score} votes"),
                  trailing: Column(
                    children: [
                      Icon(Icons.comment),
                      Text("${data.kids == null ? 0 : data.kids!.length}"),
                    ],
                  ),
                ),
              ),
            Divider(),
            ],
          );
        }
    );
  }
}
