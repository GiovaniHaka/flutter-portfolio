import 'package:flutter/material.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/characters_list_controller.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/components/character_card.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/components/filters_form.dart';
import 'package:ricky_and_morty/common/componets/cards/info_card.dart';
import 'package:ricky_and_morty/common/componets/modals/custom_modal_bottom_sheet.dart';
import 'package:ricky_and_morty/common/componets/progress_indicators/app_bar_loading.dart';
import 'package:ricky_and_morty/common/componets/progress_indicators/custom_circular_progress.dart';
import 'package:ricky_and_morty/common/componets/separators/vertical_separator.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_icon_data.dart';
import 'package:ricky_and_morty/common/constants/ui/padding_constants.dart';
import 'package:ricky_and_morty/common/states/states.dart';
import 'package:ricky_and_morty/navigator/routes.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  final controller = CharactersListController();

  @override
  void initState() {
    super.initState();
    controller.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(CustomIconData.search),
          onPressed: () {
            customModalBottomSheet(
              context: context,
              child: FiltersForm(
                initialFilters: controller.filters,
                onConfirm: (value) {
                  controller.searchWithFilters(value);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.favorites),
            icon: const Icon(Icons.favorite),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: RxBuilder(builder: (context) {
            return AppBarLoading(state: controller.state);
          }),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: RxBuilder(builder: (context) {
            switch (controller.state) {
              case States.initial:
                return const Text('Seja bem vindo!');
              case States.loading:
                return const CustomCircularProgress();
              case States.loaded:
                return controller.characters.fold(
                  (failure) => InfoCard.failure(message: failure.message),
                  (characters) => ListView.separated(
                    padding: const EdgeInsets.all(viewPadding),
                    itemBuilder: (_, index) {
                      final character = characters[index];

                      return CharacterCard(
                        character: character,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.characterDetails,
                            arguments: character,
                          );
                        },
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const VerticalSeparator();
                    },
                    itemCount: characters.length,
                  ),
                );
              default:
                return const Text('Erro');
            }
          }),
        ),
      ),
    );
  }
}
