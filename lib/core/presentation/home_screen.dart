import 'package:flutter/material.dart';
import 'package:silver/core/constants/app_colors.dart';
import 'package:silver/core/constants/app_strings.dart';
import 'package:silver/core/routing/routes.dart';
import 'package:silver/core/widgets/custome_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: AppStrings.gold,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.goldScreen);
            },
            color: AppColors.goldColor,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: AppStrings.silver,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.silverScreen);
            },
            color: AppColors.silverColor,
          ),
        ],
      ),
    );
  }
}
