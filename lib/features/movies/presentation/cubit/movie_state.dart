abstract class MovieStates {}

class MovieInitState extends MovieStates {}

class GetNowPlayingLoading extends MovieStates {}

class GetNowPlayingSuccess extends MovieStates {}

class GetNowPlayingError extends MovieStates {
  final String? errorMessage;
  GetNowPlayingError({this.errorMessage});
}

/////////////////////////////////////////////////////////////////////////////
class GetPopularLoading extends MovieStates {}

class GetPopularSuccess extends MovieStates {}

class GetPopularError extends MovieStates {
  final String errorMessage;
  GetPopularError({required this.errorMessage});
}

/////////////////////////////////////////////////////////////////////////////
class GetTopRatedLoading extends MovieStates {}

class GetTopRatedSuccess extends MovieStates {}

class GetTopRatedError extends MovieStates {
  final String errorMessage;
  GetTopRatedError({required this.errorMessage});
}

class ExpandedSliverAppBarHeight extends MovieStates {}
