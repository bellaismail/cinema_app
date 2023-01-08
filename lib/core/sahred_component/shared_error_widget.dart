import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';

class SharedErrorWidget extends StatelessWidget {
  const SharedErrorWidget(
      {super.key,
      this.containerHeight,
      this.containerWidth,
      required this.errorMessage});
  final double? containerWidth;
  final double? containerHeight;
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(
            color: AppColors.redCircleColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
