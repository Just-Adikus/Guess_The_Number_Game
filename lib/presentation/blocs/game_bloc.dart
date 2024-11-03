import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_the_number_game/core/logger/game_logger.dart';
import 'package:guess_the_number_game/domain/repositories/i_number_generator_repository.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final INumberGeneratorRepository numberRepository;
  
  GameBloc({required this.numberRepository}) : super(GameInitial()) {
    on<StartNewGame>(_onStartNewGame);
    on<MakeGuess>(_onMakeGuess);
  }

  int? _targetNumber;
  List<int> _previousGuesses = [];

  void _onStartNewGame(StartNewGame event, Emitter<GameState> emit) {
    _targetNumber = numberRepository.generateNumber(event.maxNumber);
    _previousGuesses = [];

    GameLogger.logGameStart(_targetNumber!);
    
    emit(GameInProgress(
      attemptsLeft: event.maxAttempts,
      maxNumber: event.maxNumber,
      previousGuesses: _previousGuesses,
    ));
  }

  void _onMakeGuess(MakeGuess event, Emitter<GameState> emit) {
    if (state is! GameInProgress) return;
    
    final currentState = state as GameInProgress;
    _previousGuesses.add(event.guess);
    final attemptsLeft = currentState.attemptsLeft - 1;

    GameLogger.logGuessAttempt(event.guess, attemptsLeft);

    if (event.guess == _targetNumber) {
      emit(GameWon(
        targetNumber: _targetNumber!,
        attempts: _previousGuesses.length,
      ));
    } else if (attemptsLeft == 0) {
      emit(GameLost(targetNumber: _targetNumber!));
    } else {
      String hint = event.guess > _targetNumber! ? 'Меньше' : 'Больше';
      emit(GameInProgress(
        attemptsLeft: attemptsLeft,
        maxNumber: currentState.maxNumber,
        previousGuesses: _previousGuesses,
        hint: hint,
      ));
    }
  }
}
