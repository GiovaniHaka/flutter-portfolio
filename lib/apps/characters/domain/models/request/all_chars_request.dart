import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart';

class AllCharsRequest {
  CharacterFilters? filters;
  String? url;
  
  AllCharsRequest({
    this.filters,
    this.url,
  });
}
