import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/src/bloc/comment/comment_bloc.dart';
import 'package:hacker_news/src/bloc/comment/comment_event.dart';
import 'package:hacker_news/src/bloc/comment/comment_state.dart';
import 'package:hacker_news/src/models/item_model.dart';
import 'package:hacker_news/src/repo/repository.dart';
class CommentScreen extends StatelessWidget {
  final ItemModel item;
  const CommentScreen({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Detail"),
      ),
      body: BlocProvider(
        create: (_) => CommentBloc(Repository()),
        child: Builder(
          builder: (context){
            return _buildComments(context);
          },
          ),
        )
    );
  }
  Widget _buildComments(BuildContext context) {
    final CommentBloc bloc = BlocProvider.of<CommentBloc>(context);
    // for (var value in item.kids!) {
    //   bloc.add(FetchCommentEvent(value));
    // }

    item.kids!.forEach((element) {
      bloc.add(FetchCommentEvent(element));
    });

    return Column(
      children: [
        Text(item.title!, style: Theme.of(context).textTheme.headline5,),
        Divider(),
        /// --- comments
        BlocBuilder<CommentBloc, CommentState>(
            builder: (BuildContext context, CommentState state){
              print("Comment state is ${state.comments}");
              if(state.status == CommentStatus.initial || state.status == CommentStatus.loaded){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state.status == CommentStatus.initial || state.status == CommentStatus.loaded){
                return Center(
                  child: Text(state.message!),
                );
              }
              return ListView.builder(
                  itemCount: state.comments!.length,
                  itemBuilder: (BuildContext context, int index){
                    return Text(state.comments![index].title!);
                  });
            }
        )
      ],
    );
  }
}