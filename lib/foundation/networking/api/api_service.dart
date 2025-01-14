// lib/features/networking/services/api_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../features/todo/models/todo.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/todos')
  Future<List<Todo>> getTodos();
}
