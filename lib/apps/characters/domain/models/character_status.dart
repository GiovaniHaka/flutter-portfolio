enum CharacterStatus {
  alive(translation: 'Vivo'),
  dead(translation: 'Morto'),
  unknown(translation: 'Desconhecido');

  const CharacterStatus({required this.translation});

  final String translation;

  fromString(String str) {
    switch (str) {
      case 'Alive':
        return alive;
      case 'Dead':
        return dead;
      case 'unknown':
        return unknown;
      default:
        throw UnimplementedError('Case $str not implemented');
    }
  }
}
