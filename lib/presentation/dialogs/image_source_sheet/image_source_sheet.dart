import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

part 'parts/source.dart';
part 'parts/top_row.dart';

Future<ImageSource?> showImageSourceSheet(BuildContext context) async {
  return showModalBottomSheet<ImageSource>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32),
    ),
    builder: (context) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TopRow(),
            SizedBox(height: 32),
            Row(
              children: [
                _Source(
                  icon: Icons.camera_alt_outlined,
                  source: ImageSource.camera,
                ),
                SizedBox(width: 16),
                _Source(
                  icon: Icons.image_outlined,
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
