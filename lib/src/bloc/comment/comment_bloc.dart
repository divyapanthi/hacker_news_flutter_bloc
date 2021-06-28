import 'package:bloc/bloc.dart';
import 'package:hacker_news/src/bloc/comment/comment_event.dart';
import 'package:hacker_news/src/bloc/comment/comment_state.dart';
import 'package:hacker_news/src/repo/repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>{
  final Repository repo;
  CommentBloc(this.repo) : super(CommentState(status: CommentStatus.initial));

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is FetchCommentEvent) {
      yield (CommentState(status: CommentStatus.loading));
      final item = await repo.fetchItem(event.id);
      if (item == null) {
        yield (CommentState(
            status: CommentStatus.error, message: 'Could not fetch item'));
      } else {
        yield (CommentState(
          status: CommentStatus.loaded,
          // final listOfComments = state.comments;
          // listOfComments.add(item);
          // comments: listOfComments
          comments: state.comments!..add(item),
        ));
      }
    }
  }
}