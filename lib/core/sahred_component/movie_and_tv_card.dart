import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieAndTVCard extends StatelessWidget {
  const MovieAndTVCard({
    super.key,
    this.containerHeight,
    this.containerWidth,
    required this.image,
  });
  final double? containerHeight;
  final double? containerWidth;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 10.0.h),
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppNumbers.movieCardRadius),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
