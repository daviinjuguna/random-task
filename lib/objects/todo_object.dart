import 'dart:convert';

// {
//     "userId": 1,
//     "id": 1,
//     "title": "delectus aut autem",
//     "completed": false
// }

class TodoObject {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoObject({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  TodoObject copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodoObject(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoObject.fromMap(Map<String, dynamic> map) {
    return TodoObject(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoObject.fromJson(String source) =>
      TodoObject.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodoObject(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoObject &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}
