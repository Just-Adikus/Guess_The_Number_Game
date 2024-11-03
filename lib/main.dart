import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_the_number_game/presentation/blocs/game_bloc.dart';
import 'package:guess_the_number_game/presentation/screens/game_screen.dart';
import 'package:guess_the_number_game/presentation/theme/app_theme.dart';
import 'package:guess_the_number_game/data/repositories/number_generator_repository.dart';

void main() {
  runApp(const GuessNumberGame());
}

class GuessNumberGame extends StatelessWidget {
  const GuessNumberGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Угадай число',
      theme: AppTheme.lightTheme,
      home: RepositoryProvider(
        create: (context) => NumberGeneratorRepository(),
        child: BlocProvider(
          create: (context) => GameBloc(
            numberRepository: context.read<NumberGeneratorRepository>(),
          ),
          child: const GameScreen(),
        ),
      ),
    );
  }
}



