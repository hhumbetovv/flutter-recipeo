import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipeo/constants/colors.dart';
import 'package:flutter_recipeo/constants/icons.dart';
import 'package:flutter_recipeo/constants/text_manager.dart';
import 'package:flutter_recipeo/constants/typography.dart';
import 'package:flutter_recipeo/data/models/reordable_element_model.dart';
import 'package:flutter_recipeo/presentation/global/app_ink_well.dart';
import 'package:flutter_recipeo/presentation/global/buttons/secondary_button/secondary_button.dart';
import 'package:flutter_recipeo/presentation/global/inputs/text_area_decoration.dart';
import 'package:flutter_recipeo/presentation/views/create_post/cubit/create_post_cubit.dart';
import 'package:flutter_recipeo/utils/list_utils.dart';
import 'package:flutter_svg/svg.dart';

part 'parts/add_item_button.dart';
part 'parts/list.dart';
part 'parts/list_item.dart';
part 'parts/title.dart';

class StepsContainer extends StatelessWidget {
  const StepsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Title(),
          SizedBox(height: 24),
          _List(),
          SizedBox(height: 8),
          _AddItemButton(),
        ],
      ),
    );
  }
}
