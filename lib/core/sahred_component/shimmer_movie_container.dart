import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/app_colors.dart';
import '../utils/app_numbers.dart';

class ShimmerMovieContainer extends StatelessWidget {
  const ShimmerMovieContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        margin: const EdgeInsets.all(AppNumbers.movieCardMargin),
        width: AppNumbers.movieCardWidth.w,
        height: AppNumbers.movieCardHeight.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(AppNumbers.movieCardRadius),
        ),
      ),
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.scaffoldColor,
            AppColors.textColor,
          ]),
    );
  }
}
