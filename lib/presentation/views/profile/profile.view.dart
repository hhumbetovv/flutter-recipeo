import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/user.service.dart';
import '../../../locator.dart';
import '../../../mixins/loading.state.dart';
import '../../dialogs/app_snackbar.dart';
import 'components/profile_app_bar.dart';
import 'components/profile_info/profile_info.dart';
import 'components/profile_tabs/profile_tabs.dart';

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
        body: DefaultTabController(
          length: 2,
          child: RefreshIndicator(
            onRefresh: () async {
              return getUserModel();
            },
            color: AppColors.main,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                ProfileAppBar(isLoading: isLoading),
                ProfileInfo(user: user, isLoading: isLoading),
                ProfileTabs(
                  recipes: user?.recipes ?? [],
                  liked: user?.liked ?? [],
                  profileLoading: isLoading,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
