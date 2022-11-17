import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character_filters.dart';

main() {
  group('CharacterFilters - toMap()', () {
    test('should return only name filter', () {
      final filters = [
        CharacterFilters(
          name: 'nameTest',
          species: '',
        ),
        CharacterFilters(
          name: 'nameTest',
          species: null,
        ),
      ];
      final expected = {'name': 'nameTest'};

      for (var element in filters) {
        expect(element.toMap(), equals(expected));
      }
    });

    test('should return only species filter', () {
      final filters = [
        CharacterFilters(
          name: null,
          species: 'specieTest',
        ),
        CharacterFilters(
          name: '',
          species: 'specieTest',
        ),
      ];
      final expected = {'species': 'specieTest'};

      for (var element in filters) {
        expect(element.toMap(), equals(expected));
      }
    });

    test('should return name and species filter', () {
      final filter = CharacterFilters(
        name: 'nameTest',
        species: 'specieTest',
      );

      final expected = {
        'name': 'nameTest',
        'species': 'specieTest',
      };

      expect(filter.toMap(), equals(expected));
    });
  });
}
