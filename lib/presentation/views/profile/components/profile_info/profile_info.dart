import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/text_manager.dart';
import '../../../../../constants/typography.dart';
import '../../../../../data/models/user_model.dart';

part 'parts/info.dart';
part 'parts/info_row.dart';
part 'parts/profile_picture.dart';
part 'parts/user_name.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _ProfilePicture(image: user?.image),
          const SizedBox(height: 24),
          _UserName(displayName: user?.displayName ?? TextManager.unknown),
          const SizedBox(height: 24),
          _InfoRow(
            recipes: user?.recipes.length ?? 0,
            followers: user?.followers ?? [],
            following: user?.following ?? [],
          ),
        ],
      ),
    );
  }
}
