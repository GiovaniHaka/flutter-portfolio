import 'package:flutter/material.dart';

import 'package:ricky_and_morty/common/componets/separators/vertical_separator.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_text_style.dart';
import 'package:ricky_and_morty/common/constants/ui/images_constants.dart';
import 'package:ricky_and_morty/common/constants/ui/padding_constants.dart';

class ErrorDataScreen extends StatelessWidget {
  final String title;
  final String content;

  const ErrorDataScreen({
    Key? key,
    this.title = 'Em outra dimensão!',
    this.content =
        'Algo de errado aconteceu ao pegar este portal. Por favor, tente novamente mais tarde!',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(viewPadding),
      child: Column(
        children: [
          Image.asset(
            ImageConstants.rickAndPortal,
            height: 150,
          ),
          const VerticalSeparator.large(),
          Text(
            title,
            style: CustomTextStyle.titleLarge(context),
            textAlign: TextAlign.center,
          ),
          const VerticalSeparator.small(),
          Text(
            content,
            style: CustomTextStyle.bodyMedium(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
