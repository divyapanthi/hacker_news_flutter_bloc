import 'package:hacker_news/src/models/item_model.dart';

enum CommentStatus {initial, loading, loaded, error}

class CommentState{
    final CommentStatus? status;
    final List<ItemModel>? comments;
    final int? id;
    final String? message;

const CommentState(
    {required this.status, this.comments = const[], this.id, this.message}
    );
}