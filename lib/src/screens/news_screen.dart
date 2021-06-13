import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/src/bloc/news/news_bloc.dart';
import 'package:hacker_news/src/bloc/news/news_event.dart';
import 'package:hacker_news/src/bloc/news/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsBloc bloc = BlocProvider.of<NewsBloc>(context);
    bloc.add(FetchStoriesEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending News"),
      ),
      body: buildNewsList(context),
    );
  }

  Widget buildNewsList(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {
        print("News state is ${state.status}");
        if (state.status == NewsStatus.initial) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == NewsStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == NewsStatus.error) {
          return Center(child: Text("${state.message}"));
        }
        return Center(
            child: ListView(
              children: state.ids!.map((e){
                return Text("News id $e");
        }).toList()
            )
        );
      },
    );
  }
}
