import 'package:flutter/material.dart';
import 'package:flutter_recipeo/data/models/user_model.dart';
import 'package:flutter_recipeo/data/services/user.service.dart';
import 'package:flutter_recipeo/locator.dart';
import 'package:flutter_recipeo/mixins/loading.state.dart';
import 'package:flutter_recipeo/presentation/dialogs/app_snackbar.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_app_bar.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_info/profile_info.dart';
import 'package:flutter_recipeo/presentation/views/profile/components/profile_tabs/profile_tabs.dart';

part 'profile.state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
    this.uid,
  }) : super(key: key);

  final String? uid;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends _ProfileState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : DefaultTabController(
                length: 2,
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const ProfileAppBar(),
                    ProfileInfo(user: user),
                    ProfileTabs(
                      recipes: user.recipes,
                      liked: user.liked,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
