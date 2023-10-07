import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../constants/text_manager.dart';
import '../../../constants/typography.dart';
import '../../global/app_ink_well.dart';

part 'parts/source.dart';
part 'parts/top_row.dart';

Future<ImageSource?> showImageSourceSheet(BuildContext context) async {
  return showModalBottomSheet<ImageSource>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _TopRow(),
            const SizedBox(height: 32),
            Row(
              children: [
                _Source(
                  label: TextManager.camera,
                  iconPath: AppIcons.camera.path,
                  source: ImageSource.camera,
                ),
                const SizedBox(width: 16),
                _Source(
                  label: TextManager.gallery,
                  iconPath: AppIcons.gallery.path,
                  source: ImageSource.gallery,
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
