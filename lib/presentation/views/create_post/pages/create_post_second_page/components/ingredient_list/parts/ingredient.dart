part of '../ingredient_list.dart';

class Ingredient extends StatelessWidget {
  const Ingredient({
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
          SvgPicture.asset(AppIcons.drag.path),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              initialValue: ingredient,
              onChanged: (value) {
                context.read<CreatePostCubit>().setIngredient(value, index);
              },
              cursorColor: AppColors.primary,
              decoration: BaseInputDecoration(
                hintText: TextManager.enterIngredient,
              ),
            ),
          ),
          const SizedBox(width: 8),
          AppInkWell(
            onTap: () {
              context.read<CreatePostCubit>().removeIngredient(index);
            },
            child: SvgPicture.asset(AppIcons.close.path),
          ),
        ],
      ),
    );
  }
}
