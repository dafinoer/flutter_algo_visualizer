import 'package:algovisualizer/components/app_colors.dart';
import 'package:flutter/material.dart';

final themeLight = ThemeData.light(useMaterial3: false).copyWith(
  primaryColor: AppColors.primaryColor,
  textButtonTheme: TextButtonThemeData(
    style: ThemeData.light(useMaterial3: true)
        .elevatedButtonTheme
        .style
        ?.copyWith(
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryColor),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(color: Colors.white),
            )),
  ),
);

final themeDark = ThemeData.dark(useMaterial3: true);
