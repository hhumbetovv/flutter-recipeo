part of '../image_source_sheet.dart';

class _TopRow extends StatelessWidget {
  const _TopRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppInkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(AppIcons.close.path),
            ),
          ),
        ),
        const Expanded(
          flex: 10,
          child: Center(
            child: Text(
              TextManager.chooseImageSource,
              style: AppTypography.headerMedium,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
