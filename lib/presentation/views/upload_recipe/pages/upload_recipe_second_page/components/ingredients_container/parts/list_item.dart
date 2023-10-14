part of '../ingredients_container.dart';

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.ingredient,
    required this.index,
    required this.isSingle,
  }) : super(key: key);

  final String ingredient;
  final int index;
  final bool isSingle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSingle) ...[
            SvgPicture.asset(AppIcons.drag.path),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: TextFormField(
              initialValue: ingredient,
              cursorColor: AppColors.primary,
              onChanged: (value) =>
                  context.read<UploadRecipeCubit>().setReordableElement<IngredientModel>(value, index),
              decoration: BaseInputDecoration(hintText: TextManager.enterIngredient),
            ),
          ),
          if (!isSingle) ...[
            const SizedBox(width: 8),
            AppInkWell(
              onTap: () {
                context.read<UploadRecipeCubit>().removeReordableElement<IngredientModel>(index);
              },
              child: SvgPicture.asset(AppIcons.close.path),
            ),
          ],
        ],
      ),
    );
  }
}
