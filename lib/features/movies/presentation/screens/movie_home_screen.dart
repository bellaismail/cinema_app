import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/core/utils/media_query_values.dart';
import 'package:flutter_clean_arch/features/movies/presentation/widgets/home_now_playing.dart';
import 'package:flutter_clean_arch/core/sahred_component/row_description.dart';
import 'package:flutter_clean_arch/features/movies/presentation/widgets/top_rated_list_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_clean_arch/features/movies/presentation/widgets/popular_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    print('*** home ***');
    return Scaffold(
      body: ListView(
        children: [
          const HomeNowPlayingWiget(),
          SizedBox(height: MediaQueryValues(context: context).height / 40.h),
          RowDescription(
              categoryText: AppStrings.popularText, navigatorFun: () {}),
          SizedBox(
            width: double.infinity,
            height: AppNumbers.homeHeightHorizontalList.h,
            child: const PopularListWidget(),
          ),
          RowDescription(
              categoryText: AppStrings.topRatedText, navigatorFun: () {}),
          SizedBox(
            width: double.infinity,
            height: AppNumbers.homeHeightHorizontalList.h,
            child: const TopRatedListWidget(),
          ),
        ],
      ),
    );
  }
}
