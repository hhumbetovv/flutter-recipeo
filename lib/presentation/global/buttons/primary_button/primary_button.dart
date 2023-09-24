import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../base_style.dart';

part 'parts/button_style.dart';
part 'parts/text_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isCollabsed = false,
  })  : _isOutlined = false,
        super(key: key);

  const PrimaryButton.outlined({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isCollabsed = false,
  })  : _isOutlined = true,
        super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final bool isCollabsed;
  final bool _isOutlined;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'primary-button',
      child: ElevatedButton(
        onPressed: onPressed,
        style: _ButtonStyle(_isOutlined, isCollabsed),
        child: Text(
          text,
          style: _TextStyle(_isOutlined, onPressed == null),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
