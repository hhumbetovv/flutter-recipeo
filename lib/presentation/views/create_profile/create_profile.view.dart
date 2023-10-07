import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';
import '../../../constants/routes.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../../data/services/user.service.dart';
import '../../../locator.dart';
import '../../../mixins/loading.state.dart';
import '../../dialogs/app_snackbar.dart';
import '../../dialogs/image_source_sheet/image_source_sheet.dart';
import '../../global/buttons/primary_button/primary_button.dart';
import '../../global/inputs/name_field.dart';
import 'components/profile_picture.dart';

part 'create_profile.state.dart';

class CreateProfileView extends StatefulWidget {
  const CreateProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends _CreateProfileState {
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
