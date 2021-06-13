import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker_news/src/bloc/news/news_bloc.dart';
import 'package:hacker_news/src/repo/repository.dart';
import 'package:hacker_news/src/screens/news_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: BlocProvider(
        create: (context){
          return NewsBloc(Repository());
        },
          child: NewsScreen(),
      ),
    );
  }
}
