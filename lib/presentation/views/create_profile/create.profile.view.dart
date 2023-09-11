import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/routes.dart';
import 'package:flutter_recipeo/constants/text.manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/data/models/user.model.dart';
import 'package:flutter_recipeo/data/services/auth.service.dart';
import 'package:flutter_recipeo/data/services/storage.service.dart';
import 'package:flutter_recipeo/data/services/user.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:flutter_recipeo/mixins/loading.state.dart';
import 'package:flutter_recipeo/presentation/dialogs/app.snackbar.dart';
import 'package:flutter_recipeo/presentation/dialogs/image_source_sheet/image.source.sheet.dart';
import 'package:flutter_recipeo/presentation/global/buttons/primary_button/primary.button.dart';
import 'package:flutter_recipeo/presentation/global/inputs/name_field/name.field.dart';
import 'package:flutter_recipeo/presentation/views/create_profile/components/profile.picture.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'create.profile.state.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends CreateProfileState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(TextManager.completeProfile, style: AppTypography.headerLarge),
              const SizedBox(height: 8),
              Text(
                TextManager.profileInfo,
                textAlign: TextAlign.center,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              const SizedBox(height: 32),
              ProfilePicture(onTap: pickImage, image: image),
              const SizedBox(height: 48),
              NameField(nameController: nameController, hasError: hasError),
              const SizedBox(height: 24),
              PrimaryButton(onPressed: isLoading ? null : onSubmit, text: TextManager.done)
            ],
          ),
        ),
      ),
    );
  }
}
