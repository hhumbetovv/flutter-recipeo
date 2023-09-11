part of '../image.source.sheet.dart';

class _Source extends StatelessWidget {
  const _Source({
    Key? key,
    required this.icon,
    required this.source,
  }) : super(key: key);

  final IconData icon;
  final ImageSource source;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: AppInkWell(
          onTap: () {
            context.pop(source);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.outline),
              borderRadius: BorderRadius.circular(16),
            ),
            child: FractionallySizedBox(
              heightFactor: 0.4,
              child: FittedBox(
                child: Icon(
                  icon,
                  color: AppColors.mainText,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
