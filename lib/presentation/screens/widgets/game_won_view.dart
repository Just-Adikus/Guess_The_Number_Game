import 'package:flutter/material.dart';
import 'package:guess_the_number_game/presentation/blocs/game_state.dart';

class GameWonView extends StatelessWidget {
  final GameWon state;
  final VoidCallback onNewGame;

  const GameWonView({
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
          const Icon(Icons.celebration, size: 100, color: Colors.green),
          const Text(
            'Поздравляем!',
            style: TextStyle(fontSize: 24, color: Colors.green),
          ),
          Text(
            'Вы угадали число ${state.targetNumber} за ${state.attempts} попыток!',
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
