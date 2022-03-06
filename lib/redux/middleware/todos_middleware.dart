import 'package:nyumon/redux/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:nyumon/redux/redux.dart';
import 'package:nyumon/models/models.dart';

const _todosJsonSharedPreferencesKey = 'todosJson';

final List<Middleware<AppState>> todosMiddleWare = [
  TypedMiddleware<AppState, TodoAddAction>((store, action, next) async {
    final todosState = store.state.todosState;
    final nextId = todosState.nextId;
    final todos = <Todo>[Todo(id: nextId, name: action.name)];
  })
];
