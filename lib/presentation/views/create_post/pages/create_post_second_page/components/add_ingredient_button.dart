import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/presentation/global/buttons/secondary_button/secondary_button.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';

class AddIngredientButton extends StatelessWidget {
  const AddIngredientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () {
        context.read<CreatePostCubit>().addIngredient();
      },
      text: TextManager.ingredients,
      iconPath: AppIcons.add.path,
    );
  }
}
