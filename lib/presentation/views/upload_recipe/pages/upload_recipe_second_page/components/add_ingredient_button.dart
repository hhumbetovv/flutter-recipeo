import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../constants/icons.dart';
import '../../../../../../constants/text_manager.dart';
import '../../../../../../data/models/reordable_element_model.dart';
import '../../../../../global/buttons/secondary_button/secondary_button.dart';
import '../../../cubit/upload_recipe_cubit.dart';

class AddIngredientButton extends StatelessWidget {
  const AddIngredientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () => context.read<UploadRecipeCubit>().addReordableElement<IngredientModel>(),
      text: TextManager.ingredients,
      iconPath: AppIcons.add.path,
    );
  }
}
