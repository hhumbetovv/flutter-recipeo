import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/action_row.dart';
import 'package:flutter_recipeo/presentation/views/create_post/components/bottom_action_row/bottom_action_row.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_first_page/create_post_first_page.dart';
import 'package:flutter_recipeo/presentation/views/create_post/pages/create_post_second_page/create_post_second_page.dart';

part 'create_post.state.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({
    Key? key,
  }) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends _CreatePostState {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<CreatePostCubit>().dispose();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ActionRow(),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                  children: const [
                    CreatePostFirstPage(),
                    CreatePostSecondPage(),
                  ],
                ),
              ),
              BottomActionRow(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
