import 'package:flutter/material.dart';

class TodoAddDialogStatefulWidget extends StatelessWidget {
  const TodoAddDialogStatefulWidget(
      {required this.onAdd, required this.textEditingController, Key? key})
      : super(key: key);

  final ValueChanged<String> onAdd;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text('TODO'),
        content: TextField(
          autofocus: true,
          controller: textEditingController,
          decoration: const InputDecoration(hintText: '入力しましょう'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('キャンセル'),
          ),
          ElevatedButton(
            onPressed: () {
              onAdd(textEditingController.value.text);
              Navigator.of(context).pop();
            },
            child: const Text('入力する'),
          )
        ],
      );
}

Future<T?> showTodoAddDialog<T>({
  required BuildContext context,
  required ValueChanged<String> onAdd,
}) =>
    showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (context) => TodoAddDialogStatefulWidget(
        onAdd: onAdd,
        textEditingController: TextEditingController(),
      ),
    );
