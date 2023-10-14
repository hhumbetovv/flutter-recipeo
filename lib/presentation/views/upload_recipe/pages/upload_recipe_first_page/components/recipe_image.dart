import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/icons.dart';
import '../../../../../../constants/text_manager.dart';
import '../../../../../../constants/typography.dart';
import '../../../../../dialogs/app_snackbar.dart';
import '../../../../../dialogs/image_source_sheet/image_source_sheet.dart';
import '../../../../../global/app_ink_well.dart';
import '../../../cubit/upload_recipe_cubit.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppInkWell(
        onTap: () async {
          final ImageSource? source = await showImageSourceSheet(context);
          try {
            if (context.mounted) context.read<UploadRecipeCubit>().pickImage(source);
          } catch (e) {
            if (context.mounted) showAppSnackBar(context, e.toString());
          }
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
            buildWhen: (previous, current) {
              return previous.recipeImage != current.recipeImage || previous.imageError != current.imageError;
            },
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: state.imageError ? AppColors.secondary : AppColors.outline,
                  ),
                ),
                child: state.recipeImage != null
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(
                          File(state.recipeImage!.path),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppIcons.gallery.path),
                          const SizedBox(height: 16),
                          const Text(
                            TextManager.addCoverPhoto,
                            style: AppTypography.headerSmall,
                          ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
