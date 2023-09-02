

abstract class FeedBackState {
  FeedBackState();
}

class FeedBackInitial extends FeedBackState{
  FeedBackInitial();
}

class FeedBackLoading extends FeedBackState{
  FeedBackLoading();
}

class FeedBackError extends FeedBackState{
  final String error;

  FeedBackError(this.error);
}

class FeedBackSuccess extends FeedBackState{
  FeedBackSuccess();
}