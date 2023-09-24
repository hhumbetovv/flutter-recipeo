part of '../image_source_sheet.dart';

class _Source extends StatelessWidget {
  const _Source({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.source,
  }) : super(key: key);

  final String label;
  final String iconPath;
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
              border: Border.all(
                color: AppColors.outline,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(iconPath),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: AppTypography.headerSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
