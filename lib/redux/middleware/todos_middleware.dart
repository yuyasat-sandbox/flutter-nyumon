import 'dart:convert';
import 'dart:html';
import 'dart:math' as math;
import 'package:nyumon/redux/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:nyumon/redux/redux.dart';
import 'package:nyumon/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _todosJsonSharedPreferencesKey = 'todosJson';

final List<Middleware<AppState>> todosMiddleWare = [
  TypedMiddleware<AppState, TodoAddAction>((store, action, next) async {
    final todosState = store.state.todosState;
    final nextId = todosState.nextId;
    final todos = <Todo>[Todo(id: nextId, name: action.name)];
    todos.addAll(todosState.todos ?? []);
    next(TodosSetAction(nextId: nextId + 1, todos: todos));
    next(TodosSaveAction());
  }),
  TypedMiddleware<AppState, TodoDeleteAction>((store, action, next) async {
    final todosState = store.state.todosState;
    final todos = todosState.todos!
        .where((element) => element.id != action.id)
        .toList(growable: false);
    next(TodosSetAction(todos: todos));
    next(TodosSaveAction());
  }),
  TypedMiddleware<AppState, TodoToggleCompletionAction>(
      (store, action, next) async {
    final todosState = store.state.todosState;
    final todos = todosState.todos!
        .map((todo) => todo.id == action.id
            ? todo.copyWith(isCompleted: !todo.isCompleted)
            : todo)
        .toList(growable: false);
    next(TodosSetAction(todos: todos));
    next(TodosSaveAction());
  }),
  TypedMiddleware<AppState, TodoToggleCompletionAction>(
      (store, action, next) async {
    final todosState = store.state.todosState;
    final todos = todosState.todos!
        .map((todo) => todo.id == action.id
            ? todo.copyWith(isCompleted: !todo.isCompleted)
            : todo)
        .toList(growable: false);
    next(TodosSetAction(todos: todos));
    next(TodosSaveAction());
  }),
  TypedMiddleware<AppState, TodosLoadAction>((store, action, next) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final todoJsons =
        sharedPreferences.getStringList(_todosJsonSharedPreferencesKey) ?? [];
    final todos = todoJsons
        .asMap()
        .map((index, encoded) =>
            MapEntry(index, Todo.fromJson(json.decode(encoded))))
        .values
        .toList(growable: false);
    next(TodosSetAction(
        nextId: todos.fold<int>(
                0, (previousValue, todo) => math.max(todo.id, previousValue)) +
            1,
        todos: todos));
  }),
  TypedMiddleware<AppState, TodosSaveAction>((store, action, next) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final todos = store.state.todosState.todos!
        .map((todo) => json.encode(todo.toJson()))
        .toList(growable: false);
    await sharedPreferences.setStringList(
        _todosJsonSharedPreferencesKey, todos);
  })
];
