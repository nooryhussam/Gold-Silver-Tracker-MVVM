import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver/core/constants/app_colors.dart';
import 'package:silver/core/constants/app_images.dart';
import 'package:silver/features/silver/data/repo/silver_repo.dart';
import 'package:silver/features/silver/representation/cubit/silver_cubit.dart';
import 'package:silver/features/silver/representation/cubit/silver_state.dart';
import 'package:silver/features/silver/representation/screens/widgets/custom_text.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SilverCubit(SilverRepo())..getSilver();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Silver',
            style: TextStyle(color: AppColors.silverColor),
          ),
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SilverError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (state is SilverSuccess) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.silver,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: state.silverModel.price.toString()),
                      const SizedBox(width: 5),
                      CustomText(text: state.silverModel.symbol),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
