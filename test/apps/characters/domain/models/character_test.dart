import 'package:flutter_test/flutter_test.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';

main() {
  group('CharacterLocation - fromMap()', () {
    test('should return location', () {
      final data = {
        'name': 'testName',
        'url': 'testUrl',
      };

      final expected = CharacterOrigin(name: 'testName', url: 'testUrl');

      final result = CharacterOrigin.fromMap(data);
      expect(
        result.toString(),
        expected.toString(),
      );
    });
  });
  
  group('CharacterOrigin - fromMap()', () {
    test('should return origin', () {
      final data = {
        'name': 'testName',
        'url': 'testUrl',
      };

      final expected = CharacterOrigin(name: 'testName', url: 'testUrl');

      final result = CharacterOrigin.fromMap(data);
      expect(
        result.toString(),
        expected.toString(),
      );
    });
  });

  group('CharacterStatus - fromString()', () {
    test('should return character status', () {
      expect(
        CharacterStatus.fromString('Alive'),
        CharacterStatus.alive,
      );
      expect(
        CharacterStatus.fromString('Dead'),
        CharacterStatus.dead,
      );
      expect(
        CharacterStatus.fromString('unknown'),
        CharacterStatus.unknown,
      );
    });
    test('should throw UnimplementedError', () {
      expect(() => CharacterStatus.fromString(''), throwsUnimplementedError);
    });
  });

  group('CharacterGender - fromString()', () {
    test('should return character gender', () {
      expect(
        CharacterGender.fromString('Female'),
        CharacterGender.female,
      );
      expect(
        CharacterGender.fromString('Male'),
        CharacterGender.male,
      );
      expect(
        CharacterGender.fromString('Genderless'),
        CharacterGender.genderless,
      );
      expect(
        CharacterGender.fromString('unknown'),
        CharacterGender.unknown,
      );
    });

    test('should throw UnimplementedError', () {
      expect(() => CharacterGender.fromString(''), throwsUnimplementedError);
    });
  });
}
