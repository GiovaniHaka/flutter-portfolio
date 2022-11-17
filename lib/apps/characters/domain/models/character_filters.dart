class CharacterFilters {
  String? name;
  String? species;

  CharacterFilters({
    this.name,
    this.species,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    final nameVal = name;
    if (nameVal != null && nameVal.isNotEmpty) {
      map['name'] = name;
    }

    final speciesVal = species;
    if (speciesVal != null && speciesVal.isNotEmpty) {
      map['species'] = speciesVal;
    }

    return map;
  }

  @override
  String toString() => 'CharacterFilters(name: $name, species: $species)';
}
