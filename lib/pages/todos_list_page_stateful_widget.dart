import 'package:flutter/material.dart';

import 'package:nyumon/models/models.dart';
import 'package:nyumon/pages/pages.dart';
import 'package:nyumon/widgets/dialogs/todo_add_dialog_stateful_widget.dart';

class TodosListPageStatefulWidget extends StatefulWidget {
  const TodosListPageStatefulWidget({Key? key}) : super(key: key);

  @override
  _TodosListPageStateStatefulWidget createState() =>
      _TodosListPageStateStatefulWidget();
}

class _TodosListPageStateStatefulWidget
    extends State<TodosListPageStatefulWidget> {
  final List<TodoStatefulWidget> _todos = <TodoStatefulWidget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOアプリ'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return Dismissible(
            child: Card(
              child: ListTile(
                title: Text(todo.name),
                onTap: () {
                  setState(() {
                    _todos[index] = TodoStatefulWidget(
                        isCompleted: !todo.isCompleted, name: todo.name);
                  });
                },
                trailing: todo.isCompleted
                    ? const Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : null,
              ),
              color: todo.isCompleted ? Colors.greenAccent : null,
            ),
            key: ObjectKey(todo),
            onDismissed: (direction) {
              setState(() {
                _todos.removeAt(index);
              });
            },
          );
        },
        itemCount: _todos.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTodoAddDialog(
            context: context,
            onAdd: (name) {
              setState(() {
                _todos.insert(0, TodoStatefulWidget(name: name));
              });
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
