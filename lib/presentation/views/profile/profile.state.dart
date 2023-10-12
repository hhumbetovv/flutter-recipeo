part of 'profile.view.dart';

sealed class _ProfileState extends State<ProfileView> with LoadingState {
  late UserModel user;

  @override
  void initState() {
    super.initState();
    getUserModel();
  }

  void getUserModel() async {
    toggleLoading();
    try {
      final UserService userService = locator<UserService>();
      user = await userService.getUser(uid: widget.uid);
    } catch (e) {
      if (context.mounted) showAppSnackBar(context, e.toString());
    }
    toggleLoading();
  }
}
