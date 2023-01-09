import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/utils/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        primarySwatch: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.scaffoldColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.scaffoldColor.withOpacity(0.1),
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.aBeeZee(
            color: AppColors.textColor,
            fontSize: 18.0.sp,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.actor(
            color: AppColors.textColor,
            fontSize: 12.0.sp,
          ),
          displaySmall: GoogleFonts.oswald(
            color: AppColors.textColor,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.textColor));
  }

  static ThemeData darkTheme() {
    return ThemeData();
  }
}
