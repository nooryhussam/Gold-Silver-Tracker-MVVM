import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silver/core/constants/app_colors.dart';
import 'package:silver/core/constants/app_images.dart';
import 'package:silver/features/gold/data/repo/gold_repo.dart';
import 'package:silver/features/gold/representaton/cubit/gold_cubit.dart';
import 'package:silver/features/gold/representaton/cubit/gold_state.dart';
import 'package:silver/features/gold/representaton/screens/widgets/custom_text.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GoldCubit(GoldRepo())..getGold();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Gold',
            style: TextStyle(color: AppColors.goldColor),
          ),
        ),
        backgroundColor: Colors.black,
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GoldErrorState) {
              return Center(
                child: Text(
                  state.errMsg,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else if (state is GoldSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(AppImages.gold, width: 200, height: 200),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: state.goldModel.price.toString()),
                      const SizedBox(width: 5),
                      CustomText(text: 'USD'),
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
