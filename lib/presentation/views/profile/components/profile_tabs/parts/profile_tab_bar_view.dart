part of '../profile_tabs.dart';

class _ProfileTabBarView extends StatelessWidget {
  const _ProfileTabBarView({
    Key? key,
    required this.recipes,
    required this.liked,
  }) : super(key: key);

  final List<String> recipes, liked;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Center(child: Text('Recipes')),
          Center(child: Text('Liked')),
        ],
      ),
    );
  }
}
