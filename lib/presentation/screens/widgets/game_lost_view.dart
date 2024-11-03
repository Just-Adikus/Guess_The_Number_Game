import 'package:flutter/material.dart';
import 'package:guess_the_number_game/presentation/blocs/game_state.dart';

class GameLostView extends StatelessWidget {
  final GameLost state;
  final VoidCallback onNewGame;

  const GameLostView({
    Key? key,
    required this.state,
    required this.onNewGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 100, color: Colors.red),
          const Text(
            'Игра окончена',
            style: TextStyle(fontSize: 24, color: Colors.red),
          ),
          Text(
            'Загаданное число было: ${state.targetNumber}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onNewGame,
            child: const Text('Начать новую игру'),
          ),
        ],
      ),
    );
  }
}
