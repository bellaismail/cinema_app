import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/core/utils/enums.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/cubit.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../core/sahred_component/movie_and_tv_card.dart';
import '../../../../core/sahred_component/shared_error_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/media_query_values.dart';

class HomeNowPlayingWiget extends StatelessWidget {
  const HomeNowPlayingWiget({super.key});
  @override
  Widget build(BuildContext context) {
    MovieCubit cubit = MovieCubit.get(context);
    String errorMessage = '';
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
        if (state is GetNowPlayingError) {
          errorMessage = state.errorMessage!;
        }
      },
      builder: (context, state) {
        switch (cubit.nowPlayingstatus) {
          case DataStatus.isLoaded:
            return CarouselSlider.builder(
              itemCount: cubit.nowPlayingList.length,
              options: CarouselOptions(
                enableInfiniteScroll: true,
                autoPlay: true,
                height: 340.h,
                viewportFraction: 1.0,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    FadeIn(
                      delay: const Duration(milliseconds: 400),
                      duration: const Duration(seconds: 3),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withOpacity(1),
                              Colors.white.withOpacity(0.5),
                              AppColors.scaffoldColor.withOpacity(0.0),
                            ],
                          ).createShader(rect);
                        },
                        child: MovieAndTVCard(
                          haveMargin: false,
                          image: AppStrings.getImageUrl(cubit
                              .nowPlayingList[index].backDropPath
                              .toString()),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: AppColors.redCircleColor,
                            ),
                            Text(
                              'Now Playing',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQueryValues(context: context).height / 40,
                        ),
                        FadeIn(
                          delay: const Duration(milliseconds: 700),
                          duration: const Duration(seconds: 2),
                          child: Text(cubit.nowPlayingList[index].title,
                              style: Theme.of(context).textTheme.displayLarge),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          case DataStatus.isLoading:
            return SizedBox(
              width: double.infinity,
              height: 340.h,
              child: const Center(
                child: SpinKitFadingCircle(
                  size: 50,
                  color: AppColors.textColor,
                ),
              ),
            );
          case DataStatus.fail:
            return SharedErrorWidget(
              errorMessage: cubit.errorReturn(errorMessage: errorMessage),
              containerHeight: 330.h,
              containerWidth: double.infinity,
            );
        }
      },
    );
  }
}
