import 'dart:math';
import 'package:guess_the_number_game/domain/repositories/i_number_generator_repository.dart';


class NumberGeneratorRepository implements INumberGeneratorRepository {
  final Random _random = Random();

  @override
  int generateNumber(int maxNumber) {
    return _random.nextInt(maxNumber) + 1;
  }
}
