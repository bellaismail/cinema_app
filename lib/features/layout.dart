import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';
import 'package:flutter_clean_arch/layout_cubit/layout_cubit.dart';
import 'package:flutter_clean_arch/layout_cubit/layout_state.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    print('*** layout ***');
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print('*** Layout ***');
        LayoutCubit cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.layoutBodyWidgets[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.bottomNavBar,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBNBIndex(index);
            },
            currentIndex: 1,
            items: cubit.layoutBNBList,
          ),
        );
      },
    );
  }
}
