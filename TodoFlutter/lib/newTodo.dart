import 'package:flutter/material.dart';
import './todo.dart';
import './addTodo.dart';
import './todoList.dart';

class UserTodo extends StatefulWidget {
  @override
  _UserTodoState createState() => _UserTodoState();
}

class _UserTodoState extends State<UserTodo> {
  final List<Todo> _todos = [];
  void _newTodo(String titleCame, DateTime selectedDate) {
    if (titleCame.isEmpty || selectedDate == null) {
      return;
    }
    final enteredTodo = Todo(
        date: selectedDate, title: titleCame, id: DateTime.now().toString());

    setState(() {
      _todos.add(enteredTodo);
    });
  }

  void _deleteTodo(String id) {
    setState(() {
      _todos.removeWhere((ele) {
        return ele.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTodo(_newTodo),
        TodoList(_todos, _deleteTodo),
      ],
    );
  }
}
