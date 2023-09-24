import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/dialogs/image_source_sheet/image_source_sheet.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppInkWell(
        onTap: () async {
          final ImageSource? source = await showImageSourceSheet(context);
          try {
            if (context.mounted) context.read<CreatePostCubit>().pickImage(source);
          } catch (e) {
            if (context.mounted) showAppSnackBar(context, e.toString());
          }
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: BlocBuilder<CreatePostCubit, CreatePostState>(
            buildWhen: (previous, current) {
              return previous.postImage != current.postImage || previous.imageError != current.imageError;
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
                child: state.postImage != null
                    ? Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(
                          File(state.postImage!.path),
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
