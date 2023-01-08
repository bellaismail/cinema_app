import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';

class RowDescription extends StatelessWidget {
  const RowDescription(
      {super.key, required this.categoryText, required this.navigatorFun});
  final String categoryText;
  final Function() navigatorFun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
    );
  }
}
