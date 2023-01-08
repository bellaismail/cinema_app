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
  final String messageError;
  GetPopularError({required this.messageError});
}

/////////////////////////////////////////////////////////////////////////////
class GetTopRatedLoading extends MovieStates {}

class GetTopRatedSuccess extends MovieStates {}

class GetTopRatedError extends MovieStates {
  final String messageError;
  GetTopRatedError({required this.messageError});
}
