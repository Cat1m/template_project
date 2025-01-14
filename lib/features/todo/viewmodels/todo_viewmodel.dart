// lib/features/todo/viewmodels/todo_viewmodel.dart
import 'package:flutter/foundation.dart';
import '../models/todo.dart';
import '../../../data/repositories/todo_repository.dart';

class TodoViewModel extends ChangeNotifier {
  final TodoRepository _repository;

  bool _isLoading = false;
  List<Todo> _todos = [];
  String? _error;

  TodoViewModel(this._repository);

  bool get isLoading => _isLoading;
  List<Todo> get todos => _todos;
  String? get error => _error;

  Future<void> loadTodos() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _repository.getTodos();

    result.fold(
      (error) {
        _error = error.toString();
        _todos = [];
      },
      (todos) {
        _todos = todos;
        _error = null;
      },
    );

    _isLoading = false;
    notifyListeners();
  }
}
