import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.image,
    required this.hasError,
    required this.onTap,
  }) : super(key: key);

  final XFile? image;
  final VoidCallback onTap;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppInkWell(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: hasError ? AppColors.secondary : AppColors.outline,
              ),
            ),
            child: image != null
                ? Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.file(
                      File(image!.path),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.image.path),
                      const SizedBox(height: 16),
                      const Text(
                        TextManager.addCoverPhoto,
                        style: AppTypography.headerSmall,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
