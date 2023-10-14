part of 'profile.view.dart';

sealed class _ProfileState extends State<ProfileView> with LoadingState {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    getUserModel();
  }

  Future<void> getUserModel() async {
    toggleLoading();
    try {
      await Future.delayed(const Duration(seconds: 3));
      final UserService userService = locator<UserService>();
      user = await userService.getUser(uid: widget.uid);
    } catch (e) {
      if (context.mounted) showAppSnackBar(context, e.toString());
    }
    toggleLoading();
  }
}
