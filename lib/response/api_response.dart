import 'package:flutter/foundation.dart';

import 'package:interview/objects/todo_object.dart';

class ApiResponse {
  final List<TodoObject> todo;
  final String? error;
  ApiResponse(this.todo) : error = null;
  ApiResponse.error(this.error) : todo = const [];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResponse &&
        listEquals(other.todo, todo) &&
        other.error == error;
  }

  @override
  int get hashCode => todo.hashCode ^ error.hashCode;

  @override
  String toString() => 'ApiResponse(todo: $todo, error: $error)';
}
