part of '../bottom_action_row.dart';

class _NextButton extends StatelessWidget {
  const _NextButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UploadRecipeCubit, UploadRecipeState>(
        buildWhen: (previous, current) {
          return previous.foodName != current.foodName ||
              previous.recipeImage != current.recipeImage ||
              previous.pageIndex != current.pageIndex;
        },
        builder: (context, state) {
          return PrimaryButton(
            onPressed: () async {
              if (state.pageIndex == 0) {
                if (context.read<UploadRecipeCubit>().checkNavigation()) {
                  context.read<UploadRecipeCubit>().setPageIndex(1);
                  controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                } else {
                  if (state.foodName.trim().isEmpty) {
                    showAppSnackBar(
                      context,
                      state.foodType == FoodType.food ? TextManager.foodNameError : TextManager.drinkNameError,
                    );
                  }
                  if (state.recipeImage == null) showAppSnackBar(context, TextManager.recipeImageError);
                }
              } else {
                try {
                  showUploadRecipeDialog(context);
                  await context.read<UploadRecipeCubit>().uploadRecipe();
                } catch (e) {
                  if (context.mounted) showAppSnackBar(context, e.toString());
                }
              }
            },
            text: state.pageIndex == 0 ? TextManager.next : TextManager.done,
          );
        },
      ),
    );
  }
}
