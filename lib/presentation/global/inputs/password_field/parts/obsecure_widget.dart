part of '../password_field.dart';

class _ObsecureWidget extends StatelessWidget {
  const _ObsecureWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () => onChanged(!value),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: value
            ? const Icon(
                Icons.visibility,
                size: 24,
              )
            : const Icon(
                Icons.visibility_off,
                size: 24,
              ),
      ),
    );
  }
}
