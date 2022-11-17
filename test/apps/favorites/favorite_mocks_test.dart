import 'package:mockito/annotations.dart';
import 'package:ricky_and_morty/apps/favorites/data/repositories/favorite_repository.dart';
import 'package:ricky_and_morty/apps/favorites/data/sources/favorite_source.dart';

@GenerateNiceMocks([
  MockSpec<FavoriteRepository>(),
  MockSpec<FavoriteSource>(),
])
main() {}
