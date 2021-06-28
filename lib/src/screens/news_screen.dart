import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/src/bloc/news/news_bloc.dart';
import 'package:hacker_news/src/bloc/news/news_event.dart';
import 'package:hacker_news/src/bloc/news/news_state.dart';
import 'package:hacker_news/src/widgets/news_item.dart';

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
      body: _buildNewsList(context, bloc),
    );
  }

  Widget _buildNewsList(BuildContext context, NewsBloc bloc) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (BuildContext context, NewsState state) {
        print("News state is${state.status}");
        if (state.status == NewsStatus.initial ||
            state.status == NewsStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == NewsStatus.error) {
          return Center(child: Text("${state.message}"));
        }
        //if status is loaded
        return ListView.builder(
          itemCount: state.ids!.length,
          itemBuilder: (BuildContext context, int index) {
            print("Item id ${state.ids![index]} and $index");
            final item = bloc.getItemById(state.ids![index]);
            return NewsItem(item: item,);
          },
        );
      },
    );
  }
}


//List view is eager loading thattt
// Listview is eager loading, that loads all the children at once
// ListView builder is lazy rendering/ on-demand widget rendering (jati ota item screen ma display vayeko chha teti lai matra load garauna milne)
