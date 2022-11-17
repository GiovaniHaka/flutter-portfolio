import 'package:flutter/material.dart';

import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/apps/characters/presentation/character_details/components/character_details_card.dart';
import 'package:ricky_and_morty/apps/episodes/presentation/episode_details/episodes_list_card.dart';
import 'package:ricky_and_morty/apps/location/presentation/location_details/location_details_card.dart';
import 'package:ricky_and_morty/common/componets/images/custom_network_image.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_icon_data.dart';
import 'package:ricky_and_morty/common/constants/ui/padding_constants.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenWidth - statusBarHeight,
            flexibleSpace: CustomNetworkImage(url: character.image),
          ),
          // CustomNetworkImage(url: character.image),
          SliverPadding(
            padding: const EdgeInsets.all(viewPadding),
            sliver: SliverToBoxAdapter(
              child: CharacterDetailsCard(character: character),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(viewPadding),
            sliver: SliverToBoxAdapter(
              child: LocationDetailsCard(
                title: 'Origem',
                icon: CustomIconData.origin,
                name: character.origin.name,
                url: character.origin.url,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(viewPadding),
            sliver: SliverToBoxAdapter(
              child: LocationDetailsCard(
                title: 'Localização',
                icon: CustomIconData.location,
                name: character.location.name,
                url: character.location.url,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(viewPadding),
            sliver: SliverToBoxAdapter(
              child: EpisodesListCard(urls: character.episode),
            ),
          ),
        ],
      ),
    );
  }
}
