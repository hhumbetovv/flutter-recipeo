import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../base.style.dart';

part 'parts/button.style.dart';
part 'parts/text.style.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isCollabsed = false,
  })  : _isOutlined = false,
        super(key: key);

  const SecondaryButton.outlined({
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
    return ElevatedButton(
      onPressed: onPressed,
      style: _ButtonStyle(_isOutlined, isCollabsed),
      child: Text(text, style: _TextStyle(onPressed == null)),
    );
  }
}
