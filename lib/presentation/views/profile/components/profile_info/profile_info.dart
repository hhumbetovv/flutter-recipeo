import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';

part 'parts/info.dart';
part 'parts/info_row.dart';
part 'parts/profile_picture.dart';
part 'parts/user_name.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.user,
    required this.isLoading,
  }) : super(key: key);

  final UserModel user;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          _ProfilePicture(image: user.image),
          const SizedBox(height: 24),
          _UserName(displayName: user.displayName),
          const SizedBox(height: 24),
          _InfoRow(
            recipes: user.recipes.length,
            followers: user.followers,
            following: user.following,
          ),
        ],
      ),
    );
  }
}
