import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:go_router/go_router.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppInkWell(
            onTap: () {
              context.pop();
            },
            child: Text(
              TextManager.cancel,
              style: AppTypography.headerMedium.copyWith(
                color: AppColors.secondary,
              ),
            ),
          ),
          BlocSelector<CreatePostCubit, CreatePostState, int>(
            selector: (state) {
              return state.pageIndex + 1;
            },
            builder: (context, state) {
              return Text(
                '$state/2',
                style: AppTypography.headerMedium,
              );
            },
          ),
        ],
      ),
    );
  }
}
