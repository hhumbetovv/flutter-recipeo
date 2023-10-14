import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/routes.dart';
import '../../constants/text_manager.dart';
import '../../constants/typography.dart';
import '../global/buttons/primary_button/primary_button.dart';
import '../views/upload_recipe/cubit/upload_recipe_cubit.dart';

void showUploadRecipeDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BlocSelector<UploadRecipeCubit, UploadRecipeState, bool>(
          selector: (state) {
            return state.isLoading;
          },
          builder: (context, state) {
            if (state) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Dialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.success.png, fit: BoxFit.scaleDown),
                    const SizedBox(height: 32),
                    const Text(TextManager.uploadSuccess, style: AppTypography.headerLarge),
                    const SizedBox(height: 8),
                    Text(
                      TextManager.uploadSuccessInfo,
                      textAlign: TextAlign.center,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.mainText,
                      ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                      onPressed: () {
                        context.read<UploadRecipeCubit>().dispose();
                        context.go(Routes.profile);
                      },
                      text: TextManager.goToProfile,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
