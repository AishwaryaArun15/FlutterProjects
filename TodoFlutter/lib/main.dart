import 'package:flutter/material.dart';
import './todo.dart';
import './todoList.dart';
import './addTodo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.lightGreen,
        textTheme: ThemeData.light().textTheme.copyWith(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _todos = [];
  void _newTodo(String titleCame, DateTime date1) {
    if (titleCame.isEmpty || date1 == null) {
      return;
    }
    final enteredTodo =
        Todo(date: date1, title: titleCame, id: DateTime.now().toString());

    setState(() {
      _todos.add(enteredTodo);
    });
  }

  void _slideBox(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTodo(_newTodo),
            behavior: HitTestBehavior.opaque,
          );
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
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDOList'),
        backgroundColor: Colors.pink[100],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: Card(
                elevation: 5,
                shadowColor: Colors.pink[50],
                color: Colors.pink[50],
                child: Center(
                  child: Text(
                    'Your Todo List',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                ),
              ),
            ),
            _todos.isEmpty
                ? Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'No List Yet !',
                          style: TextStyle(
                              color: Colors.pinkAccent[100],
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.network(
                        'https://cdn.pixabay.com/photo/2020/06/11/01/41/sleep-5284831_960_720.png',
                        fit: BoxFit.cover,
                      )
                    ],
                  )
                : TodoList(_todos, _deleteTodo)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _slideBox(context);
        },
        backgroundColor: Colors.pink[100],
        child: Icon(
          Icons.add,
          color: Colors.black87,
        ),
      ),
    );
  }
}
