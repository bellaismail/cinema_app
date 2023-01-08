import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/utils/app_strings.dart';
import 'package:flutter_clean_arch/layout_cubit/layout_state.dart';
import 'package:flutter_clean_arch/features/tv/presentation/screens/tv_home_screen.dart';

import '../core/utils/app_colors.dart';
import '../features/movies/presentation/screens/movie_home_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());

  static LayoutCubit get(context) => BlocProvider.of<LayoutCubit>(context);
  int currentIndex = 0;
  changeBNBIndex(index) {
    currentIndex = index;
    emit(LayouChangeBNBState());
  }

  List layoutBodyWidgets = [
    const HomeScreen(),
    const TVHomeScreen(),
  ];
  List<BottomNavigationBarItem> layoutBNBList = [
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(
          Icons.movie_creation_rounded,
          color: AppColors.textColor,
        ),
      ),
      label: AppStrings.layoutMovie,
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: const Icon(
          Icons.tv_rounded,
          color: AppColors.textColor,
        ),
      ),
      label: AppStrings.layoutTv,
    ),
  ];
}
