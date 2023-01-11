import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/sahred_component/custom_container.dart';
import 'package:flutter_clean_arch/core/sahred_component/movie_and_tv_card.dart';
import 'package:flutter_clean_arch/core/sahred_component/shared_error_widget.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/core/utils/enums.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/cubit.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/state.dart';
import 'package:flutter_clean_arch/features/movies/presentation/screens/movie_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MovieTopRatedScreen extends StatelessWidget {
  const MovieTopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String messageError = '';
    return Scaffold(
      backgroundColor: AppColors.seconsScaffoldColor,
      appBar: AppBar(
        title: Text(
          AppStrings.topRatedText,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {
          if (state is GetPopularError) {
            messageError = state.errorMessage;
          }
        },
        builder: (context, state) {
          MovieCubit cubit = MovieCubit.get(context);
          switch (cubit.topRatedstatus) {
            case DataStatus.isLoaded:
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cubit.topRatedList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (cubit.sliverAppBarHeight ==
                          AppNumbers.sliverHighHeight) {
                        cubit.sliverAppBarHeight = AppNumbers.sliverLowHeight;
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(
                            movie: cubit.topRatedList[index],
                            heroTag: 'image_hero$index',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.padding / 3,
                        vertical: AppNumbers.padding / 4,
                      ),
                      width: double.infinity,
                      height: AppNumbers.movieCardHeight * 1.2,
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldColor,
                        borderRadius: BorderRadius.circular(
                          AppNumbers.movieCardRadius,
                        ),
                      ),
                      child: Row(
                        children: [
                          Hero(
                            tag: '${AppStrings.imageHeroTag}$index',
                            child: MovieAndTVCard(
                              haveMargin: true,
                              containerHeight: AppNumbers.movieCardHeight.h,
                              containerWidth: AppNumbers.movieCardWidth.w,
                              containerRadius: AppNumbers.movieCardRadius,
                              image: AppStrings.getImageUrl(
                                  cubit.topRatedList[index].backDropPath!),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppNumbers.padding / 4),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.topRatedList[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      CustomContainer(
                                        height: 22,
                                        width: 50,
                                        bottomMargin: AppNumbers.padding / 2,
                                        topMargin: AppNumbers.padding / 2,
                                        rightMargin: AppNumbers.padding * 2,
                                        color: AppColors.redCircleColor,
                                        radius: AppNumbers.movieCardRadius / 2,
                                        widget: Text(
                                          cubit.getReleaseYear(cubit
                                              .topRatedList[index].releaseDate),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          left: AppNumbers.padding / 1.5,
                                          right: AppNumbers.padding / 3,
                                        ),
                                        child: Icon(
                                          Icons.star,
                                          color: AppColors.starColor,
                                        ),
                                      ),
                                      Text(
                                        cubit.topRatedList[index].voteAverage
                                            .toString(),
                                        style: TextStyle(
                                          color: AppColors.textColor,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    cubit.topRatedList[index].overView,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            case DataStatus.isLoading:
              return const Center(
                child: SpinKitFadingCircle(
                  size: 70.0,
                  color: AppColors.textColor,
                ),
              );
            case DataStatus.fail:
              return SharedErrorWidget(
                errorMessage: messageError,
                containerHeight: 330.h,
                containerWidth: double.infinity,
              );
          }
        },
      ),
    );
  }
}
