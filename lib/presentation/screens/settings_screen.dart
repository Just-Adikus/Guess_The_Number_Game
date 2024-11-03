import 'package:flutter/material.dart';
import 'package:guess_the_number_game/domain/entities/game_settings.dart';

class SettingsScreen extends StatefulWidget {
  final GameSettings currentSettings;
  final Function(GameSettings) onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.currentSettings,
    required this.onSettingsChanged,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _maxNumberController;
  late TextEditingController _maxAttemptsController;

  @override
  void initState() {
    super.initState();
    _maxNumberController = TextEditingController(
      text: widget.currentSettings.maxNumber.toString(),
    );
    _maxAttemptsController = TextEditingController(
      text: widget.currentSettings.maxAttempts.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Настройки игры',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _maxNumberController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Максимальное число',
                border: OutlineInputBorder(),
                helperText: 'Диапазон чисел от 1 до N',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _maxAttemptsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Количество попыток',
                border: OutlineInputBorder(),
                helperText: 'Сколько попыток будет у игрока',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveSettings,
                child: const Text('Сохранить настройки'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final maxNumber = int.tryParse(_maxNumberController.text) ?? 100;
    final maxAttempts = int.tryParse(_maxAttemptsController.text) ?? 5;

    final newSettings = GameSettings(
      maxNumber: maxNumber.clamp(1, 1000),
      maxAttempts: maxAttempts.clamp(1, 20),
    );

    widget.onSettingsChanged(newSettings);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _maxNumberController.dispose();
    _maxAttemptsController.dispose();
    super.dispose();
  }
}
