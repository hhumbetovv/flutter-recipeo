import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/images.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary_button.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:go_router/go_router.dart';

void showUploadPostDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: BlocSelector<CreatePostCubit, CreatePostState, bool>(
          selector: (state) {
            return state.isLoading;
          },
          builder: (context, state) {
            if (state) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
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
                        context.read<CreatePostCubit>().dispose();
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
