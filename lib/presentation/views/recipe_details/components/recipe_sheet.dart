import 'package:flutter/material.dart';
import 'package:flutter_recipeo/constants/colors.dart';

class RecipeSheet extends StatefulWidget {
  const RecipeSheet({
    Key? key,
    required this.children,
    required this.stackChildren,
  }) : super(key: key);

  final List<Widget> children;
  final List<Widget> stackChildren;

  @override
  State<RecipeSheet> createState() => _RecipeSheetState();
}

class _RecipeSheetState extends State<RecipeSheet> {
  late final DraggableScrollableController controller;
  final ValueNotifier<double?> dragSize = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController()
      ..addListener(() {
        dragSize.value = controller.size;
      });
  }

  @override
  void dispose() {
    controller.dispose();
    dragSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double size = (constraints.maxHeight - constraints.maxWidth + 32) / constraints.maxHeight;
          return Stack(
            children: [
              ...widget.stackChildren,
              Positioned.fill(
                child: DraggableScrollableSheet(
                  controller: controller,
                  initialChildSize: size,
                  minChildSize: size,
                  maxChildSize: 1,
                  expand: true,
                  snap: true,
                  builder: (context, scrollController) {
                    return ValueListenableBuilder(
                      valueListenable: dragSize,
                      builder: (context, dragSize, child) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular((1 - (dragSize ?? size)) / (1 - size) * 32),
                            ),
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            controller: scrollController,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: widget.children,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
