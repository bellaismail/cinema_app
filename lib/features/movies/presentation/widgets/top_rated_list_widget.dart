import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/sahred_component/movie_and_tv_card.dart';
import 'package:flutter_clean_arch/core/sahred_component/shared_error_widget.dart';
import 'package:flutter_clean_arch/core/sahred_component/shimmer_movie_container.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/enums.dart';
import 'package:flutter_clean_arch/features/movies/presentation/screens/movie_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_state.dart';

class TopRatedListWidget extends StatelessWidget {
  const TopRatedListWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String errorMessage = '';
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
        if (state is GetTopRatedError) {
          errorMessage = state.errorMessage;
        }
      },
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        switch (cubit.topRatedstatus) {
          case DataStatus.isLoading:
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return const ShimmerMovieContainer();
              },
            );
          case DataStatus.isLoaded:
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: cubit.popularList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieScreen(
                          movie: cubit.topRatedList[index],
                          heroTag:
                              '${AppStrings.topRatedText}${AppStrings.imageHeroTag}$index',
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag:
                        '${AppStrings.imageHeroTag}${AppStrings.topRatedText}$index',
                    child: MovieAndTVCard(
                      haveMargin: true,
                      containerHeight: AppNumbers.movieCardHeight.h,
                      containerWidth: AppNumbers.movieCardWidth.w,
                      containerRadius: AppNumbers.movieCardRadius,
                      image: AppStrings.getImageUrl(
                          cubit.topRatedList[index].backDropPath!),
                    ),
                  ),
                );
              },
            );
          case DataStatus.fail:
            return SharedErrorWidget(
              errorMessage: cubit.errorReturn(errorMessage: errorMessage),
              containerHeight: AppNumbers.homeHeightHorizontalList,
              containerWidth: double.infinity,
            );
        }
      },
    );
  }
}
