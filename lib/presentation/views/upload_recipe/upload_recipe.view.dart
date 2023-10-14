import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/action_row.dart';
import 'components/bottom_action_row/bottom_action_row.dart';
import 'cubit/upload_recipe_cubit.dart';
import 'pages/upload_recipe_first_page/upload_recipe_first_page.dart';
import 'pages/upload_recipe_second_page/upload_recipe_second_page.dart';

part 'upload_recipe.state.dart';

class UploadRecipeView extends StatefulWidget {
  const UploadRecipeView({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadRecipeView> createState() => _UploadRecipeViewState();
}

class _UploadRecipeViewState extends _UploadRecipeState {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<UploadRecipeCubit>().dispose();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ActionRow(),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  children: const [
                    UploadRecipeFirstPage(),
                    UploadRecipeSecondPage(),
                  ],
                ),
              ),
              BottomActionRow(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
