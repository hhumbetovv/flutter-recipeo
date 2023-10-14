part of '../profile_tabs.dart';

class _ProfileTabBarView extends StatelessWidget {
  const _ProfileTabBarView({
    Key? key,
    required this.recipes,
    required this.liked,
    required this.profileIsLoading,
  }) : super(key: key);

  final List<String> recipes, liked;
  final bool profileIsLoading;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          RecipeList(recipes: profileIsLoading ? [null, null, null, null, null, null] : recipes),
          RecipeList(recipes: profileIsLoading ? [null, null, null, null, null, null] : liked),
        ],
      ),
    );
  }
}
