enum NewsStatus {initial, loading, loaded, error}

class NewsState{
  final NewsStatus? status;
  final List<int>? ids;
  final String? message;
  const NewsState({required this.status, this.message, this.ids});
}

/*
class NewsInitial extends NewsState{}
class NewsError extends NewsState{}
class NewsLoading extends NewsState{}
class NewsLoaded extends NewsState{}

*/
