import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_numbers.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/features/movies/presentation/screens/movie_popular_screen.dart';

class RowDescription extends StatelessWidget {
  const RowDescription(
      {super.key, required this.categoryText, required this.navigatorFun});
  final String categoryText;
  final Function() navigatorFun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigatorFun,
      child: Padding(
        padding: const EdgeInsets.only(
          right: AppNumbers.padding,
          left: AppNumbers.padding,
          top: AppNumbers.padding / 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryText,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              children: [
                Text(
                  AppStrings.seeMoreText,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
