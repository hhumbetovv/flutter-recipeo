import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/colors.dart';
import '../base_style.dart';

part 'parts/button_style.dart';
part 'parts/text_style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isCollabsed = false,
    this.iconPath,
  })  : _isOutlined = false,
        super(key: key);

  const SecondaryButton.outlined({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isCollabsed = false,
    this.iconPath,
  })  : _isOutlined = true,
        super(key: key);

  final VoidCallback? onPressed;
  final String? iconPath;
  final String text;
  final bool isCollabsed;
  final bool _isOutlined;

  @override
  Widget build(BuildContext context) {
    if (iconPath?.isNotEmpty ?? false) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        style: _ButtonStyle(_isOutlined, isCollabsed),
        icon: SvgPicture.asset(
          iconPath!,
          colorFilter: ColorFilter.mode(
            onPressed == null ? AppColors.secondaryText : AppColors.main,
            BlendMode.srcIn,
          ),
        ),
        label: Text(
          text,
          style: _TextStyle(onPressed == null),
        ),
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: _ButtonStyle(_isOutlined, isCollabsed),
      child: Text(
        text,
        style: _TextStyle(onPressed == null),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
