import 'package:flutter/material.dart';
import './todo.dart';
import 'package:intl/intl.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoList;
  final Function removeTodo;
  TodoList(this.todoList, this.removeTodo);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: todoList.reversed.map(
        (e) {
          return Container(
            height: 70,
            child: Card(
              elevation: 3,
              color: Colors.grey[100],
              shadowColor: Colors.pink[50],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 100,
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      e.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[900]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(4),
                    padding: EdgeInsets.all(4),
                    child: Text(
                      'Due on:  ' + DateFormat('yyyy-MM-dd').format(e.date),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan[800]),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.pink[600],
                      ),
                      onPressed: () {
                        removeTodo(e.id);
                      })
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
