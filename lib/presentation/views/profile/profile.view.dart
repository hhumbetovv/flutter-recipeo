import 'package:flutter/material.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_app_bar.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_info/profile_info.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_tabs/profile_tabs.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    Key? key,
    this.uid,
  }) : super(key: key);

  final String? uid;

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              ProfileAppBar(),
              ProfileInfo(),
              ProfileTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
