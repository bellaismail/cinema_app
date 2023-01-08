class AppStrings {
  static const String layoutMovie = 'movie';
  static const String layoutTv = 'tv';
  static const String weatherBaseURL =
      'https://api.openweathermap.org/data/2.5';
  static const String weatherKeyId = '83151551170bc2e6e22ddf9604278c00';
  static const String movieBaseURL = 'https://api.themoviedb.org/3';
  static const String movieKeyId = '6d7d6d344014f519c89dd267c285a1cb';
  static const String baseImagesUrl = 'https://image.tmdb.org/t/p/w500';
  static const String moviePlayingEndPoint = '/movie/now_playing';
  static const String moviePopularEndPoint = '/movie/popular';
  static const String movieTopRatedEndPoint = '/movie/top_rated';
  static const String popularText = 'Popular';
  static const String topRatedText = 'Top Rated';
  static const String seeMoreText = 'see more';
  static const String notValidApiKey =
      "Invalid API key: You must be granted a valid key.";
  static const String endPointNotFounded =
      "The resource you requested could not be found.";
  static String getImageUrl(String pass) {
    return baseImagesUrl + pass;
  }
}
