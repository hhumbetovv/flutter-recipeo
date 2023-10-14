part of '../ingredients_container.dart';

class _AddItemButton extends StatelessWidget {
  const _AddItemButton({
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
