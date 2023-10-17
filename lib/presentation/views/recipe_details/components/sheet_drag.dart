import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';

class SheetDrag extends StatelessWidget {
  const SheetDrag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 40,
        height: 5,
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: const ShapeDecoration(
          color: AppColors.secondaryText,
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}
