abstract class NewsEvent{
  const NewsEvent();
}

class FetchStoriesEvent implements NewsEvent{}
class RefreshEvent implements NewsEvent{}