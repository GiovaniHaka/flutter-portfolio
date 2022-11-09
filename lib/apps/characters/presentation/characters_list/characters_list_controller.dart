import 'package:dartz/dartz.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/character.dart';
import 'package:ricky_and_morty/apps/characters/domain/models/request/all_request.dart';
import 'package:ricky_and_morty/apps/characters/domain/usecases/get_all_characters.dart';
import 'package:ricky_and_morty/common/controller/states_controller.dart';
import 'package:ricky_and_morty/common/exceptions/failure.dart';
import 'package:ricky_and_morty/common/models/rick_and_morty_api/info.dart';
import 'package:ricky_and_morty/common/states/states.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CharactersListController extends StatesController {
  late GetAllCharacters _getAllCharacters;

  CharactersListController([GetAllCharacters? getAllCharacters]) {
    _getAllCharacters = getAllCharacters ?? GetAllCharactersImp();
  }

  final _lastInfo = RxNotifier<Info?>(null);
  Info? get lastInfo => _lastInfo.value;

  final _characters =
      RxNotifier<Either<Failure, List<Character>>>(const Right([]));
  Either<Failure, List<Character>> get characters => _characters.value;

  getCharacters() async {
    try {
      setState(States.loading);
      final result = await _getAllCharacters.call(AllRequest());

      result.fold(
        (failure) => _characters.value = Left(failure),
        (response) {
          _lastInfo.value = response.info;
          _characters.value = Right(response.characters);
        },
      );
      setState(States.loaded);
    } catch (e) {
      setState(States.error);
    }
  }
}