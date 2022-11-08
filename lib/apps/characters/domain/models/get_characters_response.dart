import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/common/models/rick_and_morty_api/info.dart';

class GetCharactersResponse {
  Info info;
  List<Character> characters;

  GetCharactersResponse({
    required this.info,
    required this.characters,
  });
}
