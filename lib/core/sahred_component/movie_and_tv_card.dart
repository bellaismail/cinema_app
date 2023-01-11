import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieAndTVCard extends StatelessWidget {
  const MovieAndTVCard({
    super.key,
    this.containerHeight,
    this.containerWidth,
    required this.image,
    this.containerRadius,
    required this.haveMargin,
  });
  final double? containerHeight;
  final double? containerWidth;
  final String image;
  final double? containerRadius;
  final bool haveMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: haveMargin
          ? EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 10.0.h)
          : null,
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(containerRadius ?? 0.0),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
