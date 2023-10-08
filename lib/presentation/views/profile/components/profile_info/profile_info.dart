import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/typography.dart';

part 'parts/info.dart';
part 'parts/info_row.dart';
part 'parts/profile_picture.dart';
part 'parts/user_name.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const _ProfilePicture(),
          const SizedBox(height: 24),
          const _UserName(),
          const SizedBox(height: 24),
          const _InfoRow(),
        ],
      ),
    );
  }
}
