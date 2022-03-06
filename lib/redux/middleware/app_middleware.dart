import 'package:redux/redux.dart';

import 'package:nyumon/redux/redux.dart';
import 'todos_middleware.dart';

final List<Middleware<AppState>> appMiddleware = [
  todosMiddleWare,
].expand((middleware) => middleware).toList(growable: false);
