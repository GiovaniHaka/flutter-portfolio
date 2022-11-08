enum CharacterGender {
  female(translation: 'Feminino'),
  male(translation: 'Masculino'),
  genderless(translation: 'Sem gênero'),
  unknown(translation: 'Desconhecido');

  const CharacterGender({required this.translation});

  final String translation;

  fromString(String str) {
    switch (str) {
      case 'Female':
        return female;
      case 'Male':
        return male;
      case 'Genderless':
        return genderless;
      case 'unknown':
        return unknown;
      default:
        throw UnimplementedError('Case $str not implemented');
    }
  }
}
