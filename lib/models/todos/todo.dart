import 'package:json_annotation/json_annotation.dart';
part 'todo.g.dart';

class TodoStatefulWidget {
  const TodoStatefulWidget({this.isCompleted = false, required this.name});

  final bool isCompleted;

  final String name;
}

// fvm flutter packages pub run build_runner build
@JsonSerializable()
class Todo {
  const Todo({required this.id, this.isCompleted = false, required this.name});

  final int id;
  final bool isCompleted;
  final String name;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Todo copyWith({
    int? id,
    bool? isCompleted,
    String? name,
  }) =>
      Todo(
        id: id ?? this.id,
        isCompleted: isCompleted ?? this.isCompleted,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
