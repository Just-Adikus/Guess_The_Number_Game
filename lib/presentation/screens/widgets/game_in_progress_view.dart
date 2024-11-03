import 'package:flutter/material.dart';
import 'package:guess_the_number_game/presentation/blocs/game_state.dart';

class GameInProgressView extends StatelessWidget {
  final GameInProgress state;
  final TextEditingController controller;
  final Function(int) onGuessSubmitted;

  const GameInProgressView({
    Key? key,
    required this.state,
    required this.controller,
    required this.onGuessSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Угадайте число от 1 до ${state.maxNumber}',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            'Осталось попыток: ${state.attemptsLeft}',
            style: const TextStyle(fontSize: 18),
          ),
          if (state.hint != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Подсказка: ${state.hint}',
                style: const TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          const SizedBox(height: 20),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Введите число',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final guess = int.tryParse(controller.text);
              if (guess != null) {
                onGuessSubmitted(guess);
              }
            },
            child: const Text('Проверить'),
          ),
        ],
      ),
    );
  }
}
