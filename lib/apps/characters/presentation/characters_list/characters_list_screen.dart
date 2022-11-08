import 'package:flutter/material.dart';
import 'package:ricky_and_morty/apps/characters/presentation/characters_list/characters_list_controller.dart';
import 'package:ricky_and_morty/common/states/states.dart';
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
      appBar: AppBar(),
      body: Center(
        child: RxBuilder(builder: (context) {
          switch (controller.state) {
            case States.initial:
              return const Text('Seja bem vindo!');
            case States.loading:
              return const CircularProgressIndicator();
            case States.loaded:
              return controller.characters.fold(
                (failure) => Text(failure.message),
                (characters) => ListView.separated(
                  itemBuilder: (_, index) {
                    final character = characters[index];

                    return Text(character.name);
                  },
                  separatorBuilder: (_, index) {
                    return const Divider();
                  },
                  itemCount: characters.length,
                ),
              );
            default:
              return const Text('Erro');
          }
        }),
      ),
    );
  }
}
