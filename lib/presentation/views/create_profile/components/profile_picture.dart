import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors.dart';
import '../../../global/app_ink_well.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    this.image,
    required this.onTap,
  }) : super(key: key);

  final XFile? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: AppInkWell(
        onTap: onTap,
        child: FractionallySizedBox(
          heightFactor: 1,
          child: image == null
              ? const FittedBox(
                  child: Icon(
                    Icons.account_circle,
                    color: AppColors.mainText,
                  ),
                )
              : Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
