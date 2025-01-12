// lib/features/counter/models/counter_action.dart
enum ActionType { increment, decrement }

class CounterAction {
  final ActionType type;
  final DateTime timestamp;
  final int value;

  CounterAction({
    required this.type,
    required this.timestamp,
    required this.value,
  });
}
