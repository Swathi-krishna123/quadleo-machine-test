import 'package:flutter/material.dart';
import 'package:quadleo_machine_test/utils/constants/app_colors.dart';

class AppFonts {
  static const String fontFamily = 'Montserrat';
  static const double height = 22 / 28;
  static const double letterSpacing = -0.56;

  static const TextStyle buttontxt = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
    height: height,
    letterSpacing: letterSpacing,
  );
  static const TextStyle buttontxt2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
    height: height,
    letterSpacing: letterSpacing,
  );
  static const TextStyle hinttxt = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.hint,
    height: height,
    letterSpacing: letterSpacing,
  );
  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
    height: height,
    letterSpacing: letterSpacing,
  );
  static const TextStyle subheading = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.secondary,
    height: height,
    letterSpacing: letterSpacing,
  );
}
