import 'package:logger/logger.dart';

class GameLogger {
  static final Logger _logger = Logger();

  static void logGameStart(int targetNumber) {
    _logger.i('New game started. Target number: $targetNumber');
  }

  static void logGuessAttempt(int guess, int attemptsLeft) {
    _logger.i('Guess made: $guess, Attempts left: $attemptsLeft');
  }
}
