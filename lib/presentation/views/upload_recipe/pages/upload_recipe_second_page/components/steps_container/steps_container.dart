import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../constants/colors.dart';
import '../../../../../../../constants/icons.dart';
import '../../../../../../../constants/text_manager.dart';
import '../../../../../../../constants/typography.dart';
import '../../../../../../../data/models/reordable_element_model.dart';
import '../../../../../../../utils/list_utils.dart';
import '../../../../../../global/app_ink_well.dart';
import '../../../../../../global/buttons/secondary_button/secondary_button.dart';
import '../../../../../../global/inputs/text_area_decoration.dart';
import '../../../../cubit/upload_recipe_cubit.dart';

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
