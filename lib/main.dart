import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/config/app_theme/app_theme.dart';
import 'package:flutter_clean_arch/config/data_helper/remote_data_helper.dart';
import 'package:flutter_clean_arch/config/services/service_locator.dart';
import 'package:flutter_clean_arch/features/movies/presentation/cubit/cubit.dart';
import 'package:flutter_clean_arch/features/movies/presentation/screens/movie_popular_screen.dart';
import 'package:flutter_clean_arch/layout_cubit/layout_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/bloc_observer/bloc_observer.dart';
import 'features/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  WeatherRemoteDataHelper.init();
  MovieRemoteDataHelper.init();
  ServiceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
            create: (context) => MovieCubit()
              ..getNowplaying()
              ..getPopular()
              ..getTopRated()),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            home: const Layout(),
          );
        },
      ),
    );
  }
}
