part of '../steps_container.dart';

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.step,
    required this.index,
    required this.isSingle,
  }) : super(key: key);

  final String step;
  final int index;
  final bool isSingle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.drag.path),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  initialValue: step,
                  minLines: 4,
                  maxLines: null,
                  cursorColor: AppColors.primary,
                  onChanged: (value) => context.read<CreatePostCubit>().setReordableElement<StepModel>(value, index),
                  decoration: TextAreaDecoration(
                    hintText: TextManager.enterStep,
                  ),
                ),
              ),
              if (!isSingle) ...[
                const SizedBox(width: 8),
                AppInkWell(
                  onTap: () {
                    context.read<CreatePostCubit>().removeReordableElement<StepModel>(index);
                  },
                  child: SvgPicture.asset(AppIcons.close.path),
                ),
              ],
            ],
          ),
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FittedBox(
              child: Text(
                '${index + 1}',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
