import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_manager.dart';
import '../../../../constants/typography.dart';
import '../../../global/app_ink_well.dart';
import '../cubit/create_post_cubit.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppInkWell(
            onTap: () {
              context.read<CreatePostCubit>().dispose();
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
