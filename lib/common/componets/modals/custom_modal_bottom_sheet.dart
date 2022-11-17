import 'package:flutter/material.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_colors.dart';
import 'package:ricky_and_morty/common/constants/ui/radius_constants.dart';

customModalBottomSheet({
  required BuildContext context,
  required Widget child,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: CustomColors.backgroundColor,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(defaultRadius),
        topRight: Radius.circular(defaultRadius),
      ),
    ),
    builder: (_) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SafeArea(
          child: child,
        ),
      );
    },
  );
}
