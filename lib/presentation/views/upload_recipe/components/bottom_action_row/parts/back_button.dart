part of '../bottom_action_row.dart';

class _BackButton extends StatelessWidget {
  const _BackButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UploadRecipeCubit, UploadRecipeState, bool>(
      selector: (state) {
        return state.pageIndex == 1;
      },
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: state ? MediaQuery.sizeOf(context).width / 2 - 24 : 0,
          curve: Curves.decelerate,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            scale: state ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SecondaryButton(
                onPressed: () {
                  context.read<UploadRecipeCubit>().setPageIndex(0);
                  controller.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                text: TextManager.back,
              ),
            ),
          ),
        );
      },
    );
  }
}
