import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/error/failure.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/core/utils/enums.dart';
import 'package:flutter_clean_arch/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter_clean_arch/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/state.dart';
import 'package:flutter_clean_arch/config/services/service_locator.dart';
import '../../domain/enitities/movie.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieInitState());

  static MovieCubit get(context) => BlocProvider.of<MovieCubit>(context);

  double sliverAppBarHeight = AppNumbers.sliverLowHeight;
  DataStatus nowPlayingstatus = DataStatus.isLoading;
  DataStatus popularStatus = DataStatus.isLoading;
  DataStatus topRatedstatus = DataStatus.isLoading;
  List<Movie> nowPlayingList = [];
  List<Movie> popularList = [];
  List<Movie> topRatedList = [];

  changeSliverAppBarHeight() {
    if (sliverAppBarHeight == AppNumbers.sliverLowHeight) {
      sliverAppBarHeight = AppNumbers.sliverHighHeight;
    } else {
      sliverAppBarHeight = AppNumbers.sliverLowHeight;
    }
    emit(ExpandedSliverAppBarHeight());
  }

  String errorReturn({String? errorMessage}) {
    String errorMessageVar = '';
    if (errorMessage == AppStrings.notValidApiKey) {
      errorMessageVar = 'ERROR: 401 API_NOT_VALID';
    } else {
      errorMessageVar == 'ERROR: 404 NOT_FOUNDED';
    }
    return errorMessageVar;
  }

  String getReleaseYear(String date) {
    String releaseYear = '';
    releaseYear = date.split('-').first;
    return releaseYear;
  }

  Future<void> getNowplaying() async {
    emit(GetNowPlayingLoading());
    var response = await getIt<BaseGetNowPlayingMoviesUsecase>().excute();
    response.fold((l) {
      emit(GetNowPlayingError(errorMessage: l.message));
      nowPlayingstatus = DataStatus.fail;
    }, (r) {
      emit(GetNowPlayingSuccess());
      nowPlayingList = r;
      nowPlayingstatus = DataStatus.isLoaded;
    });
  }

  Future<void> getPopular() async {
    emit(GetPopularLoading());
    Either<Failure, List<Movie>> response =
        await getIt<BaseGetPopularMoviesUseCase>().excute();
    response.fold((l) {
      emit(GetPopularError(errorMessage: l.message));
      popularStatus = DataStatus.fail;
    }, (r) {
      emit(GetPopularSuccess());
      popularList = r;
      popularStatus = DataStatus.isLoaded;
    });
  }

  Future<void> getTopRated() async {
    emit(GetTopRatedLoading());
    Either<Failure, List<Movie>> response =
        await getIt<BaseGetTopRatedMoviesUseCase>().excute();
    response.fold((l) {
      emit(GetTopRatedError(errorMessage: l.message));
      topRatedstatus = DataStatus.fail;
    }, (r) {
      emit(GetTopRatedSuccess());
      topRatedstatus = DataStatus.isLoaded;
      topRatedList = r;
    });
  }
}
