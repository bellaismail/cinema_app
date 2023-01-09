import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_arch/core/sahred_component/movie_and_tv_card.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/core/utils/media_query_values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviePopularScreen extends StatelessWidget {
  const MoviePopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(
          AppStrings.popularText,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
                horizontal: AppNumbers.padding / 3,
                vertical: AppNumbers.padding / 4),
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
                MovieAndTVCard(
                  containerHeight: AppNumbers.movieCardHeight.h,
                  containerWidth: AppNumbers.movieCardWidth.w,
                  image: AppStrings.getImageUrl(
                      '/evaFLqtswezLosllRZtJNMiO1UR.jpg'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppNumbers.padding / 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Demon Playing-kimonute bilal',
                          style: Theme.of(context).textTheme.displayLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: AppNumbers.padding / 2,
                            bottom: AppNumbers.padding / 2,
                            right: 40,
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 50.w,
                                height: 22.h,
                                decoration: BoxDecoration(
                                  color: AppColors.redCircleColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  '2023',
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
                                '3.5',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'my name si bilal ashraf ismail ahmed ismail radwan, i\'m 22 years old ',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
