import 'package:flutter/material.dart';

import 'package:ricky_and_morty/common/componets/separators/vertical_separator.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_colors.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_text_style.dart';
import 'package:ricky_and_morty/common/constants/ui/images_constants.dart';
import 'package:ricky_and_morty/common/constants/ui/padding_constants.dart';

class EmptyDataScreen extends StatelessWidget {
  final String title;
  final String content;

  const EmptyDataScreen({
    Key? key,
    this.title = 'Vazio espacial!',
    this.content = 'Não encontramos nenhuma informação nesta dimensão.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(viewPadding),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: CustomColors.pinkLight,
                  shape: BoxShape.circle,
                ),
              ),
              Image.asset(
                ImageConstants.rickPicle,
                height: 150,
              ),
            ],
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
