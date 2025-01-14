// lib/features/todo/repositories/todo_repository.dart
import 'package:dartz/dartz.dart';
import 'package:template_project/foundation/networking/api/api_service.dart';
import 'package:template_project/features/todo/models/todo.dart';

class TodoRepository {
  final ApiService _apiService;

  TodoRepository(this._apiService);

  Future<Either<String, List<Todo>>> getTodos() async {
    try {
      final todos = await _apiService.getTodos();
      return Right(todos); // Không cần map nữa vì đã là List<Todo>
    } catch (e) {
      return Left(e.toString());
    }
  }
}
