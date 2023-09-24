part of '../food_type_selection.dart';

class _FoodTypeRadio extends StatelessWidget {
  const _FoodTypeRadio({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final FoodType value;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => context.read<CreatePostCubit>().onFoodTypeSelected(value),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<CreatePostCubit, CreatePostState, FoodType>(
            selector: (state) => state.foodType,
            builder: (context, state) {
              return Radio(
                activeColor: AppColors.primary,
                value: value,
                groupValue: state,
                onChanged: (value) => context.read<CreatePostCubit>().onFoodTypeSelected(value),
              );
            },
          ),
          Text(
            label,
            style: AppTypography.headerSmall.copyWith(
              height: 1.25,
            ),
          )
        ],
      ),
    );
  }
}
