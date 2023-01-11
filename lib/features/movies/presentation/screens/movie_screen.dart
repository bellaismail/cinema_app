import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/sahred_component/custom_container.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/media_query_values.dart';
import 'package:flutter_clean_arch/features/movies/domain/enitities/movie.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/cubit.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scale_button/scale_button.dart';
import '../../../../core/sahred_component/movie_and_tv_card.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key, required this.movie, required this.heroTag});

  final Movie movie;
  final String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.seconsScaffoldColor,
      body: BlocConsumer<MovieCubit, MovieStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MovieCubit cubit = MovieCubit.get(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight:
                    AppNumbers.movieCardHeight.h * cubit.sliverAppBarHeight,
                backgroundColor: AppColors.scaffoldColor,
                elevation: 0.0,
                flexibleSpace: AnimatedContainer(
                  height:
                      AppNumbers.movieCardHeight.h * cubit.sliverAppBarHeight,
                  duration: const Duration(seconds: 1),
                  child: InkWell(
                    onTap: () {
                      cubit.changeSliverAppBarHeight();
                    },
                    child: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Opacity(
                        opacity: 0.8,
                        child: Hero(
                          tag: heroTag,
                          child: MovieAndTVCard(
                            haveMargin: false,
                            image: AppStrings.getImageUrl(
                              movie.backDropPath.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: AppNumbers.padding / 2,
                    horizontal: AppNumbers.padding / 1.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Row(
                        children: [
                          CustomContainer(
                            height: 22.h,
                            width: 50.w,
                            bottomMargin: AppNumbers.padding / 2,
                            topMargin: AppNumbers.padding / 2,
                            rightMargin: AppNumbers.padding * 2,
                            color: AppColors.scaffoldColor,
                            radius: AppNumbers.movieCardRadius / 2,
                            widget: Text(
                              '2023',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ),
                          const Padding(
                            padding:
                                EdgeInsets.only(right: AppNumbers.padding / 2),
                            child: Icon(
                              Icons.star,
                              color: AppColors.starColor,
                            ),
                          ),
                          Text(
                            movie.voteAverage.toString(),
                            style: const TextStyle(
                              color: AppColors.textColor,
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQueryValues(context: context).width / 20,
                          ),
                          const Text(
                            '1 seasons ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width:
                                MediaQueryValues(context: context).width / 40,
                          ),
                          const Text(
                            '24 m',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQueryValues(context: context).height * .01,
                      ),
                      Text(
                        movie.overView,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(
                        height: MediaQueryValues(context: context).height * .01,
                      ),
                      const Text(
                        'Generes: Animation, Family, Comdey, Fantasy',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryValues(context: context).height * .05,
                      ),
                      Text(
                        'more like this'.toUpperCase(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      SizedBox(
                        height: MediaQueryValues(context: context).height * .03,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.popularList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: AppNumbers.padding / 4,
                          mainAxisSpacing: AppNumbers.padding / 4,
                          childAspectRatio: .75,
                        ),
                        itemBuilder: (context, index) {
                          return ScaleButton(
                            duration: const Duration(milliseconds: 300),
                            bound: 0.1,
                            reverse: true,
                            child: GestureDetector(
                              onTap: () {
                                if (movie.id != cubit.popularList[index].id) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieScreen(
                                        movie: cubit.popularList[index],
                                        heroTag: heroTag,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: MovieAndTVCard(
                                containerRadius: AppNumbers.movieCardRadius / 2,
                                image: AppStrings.getImageUrl(cubit
                                    .popularList[index].backDropPath
                                    .toString()),
                                haveMargin: false,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
