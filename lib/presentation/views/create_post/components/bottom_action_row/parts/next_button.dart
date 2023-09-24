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
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        buildWhen: (previous, current) {
          return previous.foodName != current.foodName || previous.postImage != current.postImage;
        },
        builder: (context, state) {
          return PrimaryButton(
            onPressed: () {
              if (context.read<CreatePostCubit>().checkNavigation()) {
                context.read<CreatePostCubit>().setPageIndex(1);
                controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                if (state.foodName.trim().isEmpty) {
                  showAppSnackBar(
                    context,
                    state.foodType == FoodType.food ? TextManager.foodNameError : TextManager.drinkNameError,
                  );
                }
                if (state.postImage == null) {
                  showAppSnackBar(context, TextManager.postImageError);
                }
              }
            },
            text: 'Next',
          );
        },
      ),
    );
  }
}
