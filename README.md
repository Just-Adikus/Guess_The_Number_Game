# Guess Number Game

Игра "Угадай число" - мобильное приложение на Flutter, в котором пользователь должен угадать случайное число, загаданное системой.

## Описание

Приложение генерирует случайное число в заданном диапазоне, и пользователь должен угадать его за ограниченное количество попыток. После каждой попытки пользователь получает подсказку о том, больше или меньше загаданное число.

### Основные функции

- Настраиваемый диапазон чисел
- Настраиваемое количество попыток
- Подсказки после каждой попытки
- Экраны победы и проигрыша
- Возможность начать новую игру
- Логирование игровых событий

## Требования

- Flutter SDK (версия >= 2.12.0)
- Dart SDK (версия >= 2.12.0)
- Android Studio / VS Code
- Android SDK для Android-сборки
- Xcode для iOS-сборки (только на macOS)

## Установка

1. Убедитесь, что у вас установлен Flutter SDK:
```bash
flutter --version
```

2. Клонируйте репозиторий:
```bash
git clone https://your-repository-url/guess_number_game.git
cd guess_number_game
```

3. Установите зависимости:
```bash
flutter pub get
```

## Запуск

### Разработка

1. Запустите эмулятор iOS/Android или подключите физическое устройство

2. Запустите приложение в режиме отладки:
```bash
flutter run
```

### Сборка релизной версии

#### Android

```bash
flutter build apk --release
```
APK файл будет доступен по пути: `build/app/outputs/flutter-apk/app-release.apk`

#### iOS (только на macOS)

```bash
flutter build ios --release
```
Откройте Xcode и выполните финальную сборку через него.

## Структура проекта

```
lib/
├── main.dart                          # Точка входа в приложение
├── core/
│   └── logger/
│       └── game_logger.dart           # Логирование игровых событий
├── data/
│   └── repositories/
│       └── number_generator_repository.dart  # Генерация случайных чисел
├── domain/
│   ├── entities/
│   │   └── game_settings.dart         # Модель настроек игры
│   └── repositories/
│       └── i_number_generator_repository.dart # Интерфейс генератора чисел
└──presentation/
   ├── blocs/
   │   ├── game/                      # Бизнес-логика игры
   │   │   ├── game_bloc.dart
   │   │   ├── game_event.dart
   │   │   └── game_state.dart
   ├── screens/
   │   ├── game_screen.dart           # Основной экран игры
   │   ├── game_settings.dart         # Изменение настроек игры
   │   └── widgets/                   # Виджеты UI
   └── theme/
       └── app_theme.dart             # Настройки темы приложения

```

## Тестирование

Запуск unit-тестов:
```bash
flutter test
```

## Технологический стек

- Flutter
- flutter_bloc (управление состоянием)
- logger (логирование)
- Material Design 3

## Особенности архитектуры

- Clean Architecture
- BLoC pattern для управления состоянием
- Dependency Injection
- Repository pattern


## Настройка игры

В приложении можно настроить:
1. Максимальное число для загадывания (1-1000)
2. Количество попыток (1-20)

Для доступа к настройкам нажмите на иконку шестеренки в правом верхнем углу экрана.


## Разработка

### Добавление новых функций

1. Создайте новую ветку:
```bash
git checkout -b feature/your-feature-name
```

2. Внесите изменения и создайте тесты

3. Запустите тесты:
```bash
flutter test
```

4. Создайте Pull Request

### Стиль кода

- Следуйте [руководству по стилю Dart](https://dart.dev/guides/language/effective-dart/style)
- Используйте строгий режим типизации
- Добавляйте документацию для публичных API
- Форматируйте код с помощью `dart format`



