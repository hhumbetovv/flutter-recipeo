import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../constants/text_manager.dart';
import '../../../../../global/buttons/primary_button/primary_button.dart';
import '../../../../../global/buttons/secondary_button/secondary_button.dart';

class BottomActionRow extends StatelessWidget {
  const BottomActionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          Expanded(
            child: SecondaryButton(
              onPressed: () {
                context.pop();
              },
              text: TextManager.back,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: PrimaryButton(
              onPressed: () {},
              text: TextManager.done,
            ),
          ),
        ],
      ),
    );
  }
}
