abstract class BaseMovieLocalDatasource {
  Future<bool> getDarkMood();
}

class MovieLocalDataSourse implements BaseMovieLocalDatasource {
  @override
  Future<bool> getDarkMood() async {
    return false;
  }
}
