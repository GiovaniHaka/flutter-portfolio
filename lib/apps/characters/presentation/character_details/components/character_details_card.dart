import 'package:flutter/material.dart';

import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/common/componets/cards/decorated_card.dart';
import 'package:ricky_and_morty/common/componets/separators/horizontal_separator.dart';
import 'package:ricky_and_morty/common/componets/separators/vertical_separator.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_colors.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_icon_data.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_text_style.dart';
import 'package:ricky_and_morty/common/constants/ui/separator_constants.dart';

class CharacterDetailsCard extends StatelessWidget {
  final Character character;

  const CharacterDetailsCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          character.name,
          style: CustomTextStyle.titleLarge(context),
          overflow: TextOverflow.ellipsis,
        ),
        const VerticalSeparator.small(),
        Wrap(
          runSpacing: defaultSeparator,
          spacing: defaultSeparator,
          children: [
            DetailClip(
              icon: CustomIconData.specie,
              backgroundColor: CustomColors.greenLight,
              foregroundColor: CustomColors.greenStrong,
              text: character.species,
            ),
            DetailClip(
              icon: CustomIconData.aliveStatus,
              backgroundColor: CustomColors.purpleLight,
              foregroundColor: CustomColors.purpleStrong,
              text: character.status.translation,
            ),
          ],
        ),
      ],
    );
  }
}

class DetailClip extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final IconData icon;

  const DetailClip({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: foregroundColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: foregroundColor,
            size: 18,
          ),
          const HorizontalSeparator.small(),
          Text(
            text,
            style: CustomTextStyle.labelMedium(context).copyWith(
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
