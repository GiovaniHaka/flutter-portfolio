import 'package:flutter/material.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/characters_list_controller.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/components/characters_list.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/components/filters_form.dart';
import 'package:ricky_and_morty/common/componets/modals/custom_modal_bottom_sheet.dart';
import 'package:ricky_and_morty/common/componets/progress_indicators/app_bar_loading.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_icon_data.dart';
import 'package:ricky_and_morty/common/constants/ui/custom_text_style.dart';
import 'package:ricky_and_morty/common/constants/ui/padding_constants.dart';
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
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
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
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.favorites),
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
            SliverPadding(
              padding: const EdgeInsets.all(viewPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Personagens',
                  style: CustomTextStyle.headlineSmall(context),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: viewPadding),
              sliver: RxBuilder(
                builder: (context) {
                  return CharactersList(
                    characters: controller.characters,
                    state: controller.state,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
