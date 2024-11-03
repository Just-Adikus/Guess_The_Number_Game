import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_the_number_game/domain/entities/game_settings.dart';
import 'package:guess_the_number_game/presentation/blocs/game_bloc.dart';
import 'package:guess_the_number_game/presentation/blocs/game_event.dart';
import 'package:guess_the_number_game/presentation/blocs/game_state.dart';
import 'package:guess_the_number_game/presentation/screens/settings_screen.dart';
import 'package:guess_the_number_game/presentation/screens/widgets/game_in_progress_view.dart';
import 'package:guess_the_number_game/presentation/screens/widgets/game_lost_view.dart';
import 'package:guess_the_number_game/presentation/screens/widgets/game_won_view.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final TextEditingController _guessController = TextEditingController();
  late GameSettings _gameSettings;

  @override
  void initState() {
    super.initState();
    _gameSettings = const GameSettings(
      maxNumber: 100,
      maxAttempts: 5,
    );
    _startNewGame();
  }

  void _startNewGame() {
    context.read<GameBloc>().add(
          StartNewGame(
            maxNumber: _gameSettings.maxNumber,
            maxAttempts: _gameSettings.maxAttempts,
          ),
        );
    _guessController.clear();
  }

  void _openSettings() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettingsScreen(
          currentSettings: _gameSettings,
          onSettingsChanged: (newSettings) {
            setState(() {
              _gameSettings = newSettings;
              _startNewGame();
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Угадай число'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _openSettings,
          ),
        ],
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameInProgress) {
            return GameInProgressView(
              state: state,
              controller: _guessController,
              onGuessSubmitted: (guess) {
                context.read<GameBloc>().add(MakeGuess(guess));
                _guessController.clear();
              },
            );
          } else if (state is GameWon) {
            return GameWonView(
              state: state,
              onNewGame: _startNewGame,
            );
          } else if (state is GameLost) {
            return GameLostView(
              state: state,
              onNewGame: _startNewGame,
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  @override
  void dispose() {
    _guessController.dispose();
    super.dispose();
  }
}
