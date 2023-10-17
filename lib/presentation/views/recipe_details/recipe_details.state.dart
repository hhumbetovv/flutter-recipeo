part of 'recipe_details.view.dart';

sealed class _RecipeDetailsState extends State<RecipeDetailsView> with AutomaticKeepAliveClientMixin, LoadingState {
  UserModel? author;
  @override
  bool get wantKeepAlive => true;

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
      author = await userService.getUser(uid: widget.recipe.authorId);
    } catch (e) {
      if (context.mounted) showAppSnackBar(context, e.toString());
    }
    toggleLoading();
  }
}
