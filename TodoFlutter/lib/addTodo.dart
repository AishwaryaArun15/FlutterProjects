import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTodo extends StatefulWidget {
  final Function addTodo;
  AddTodo(this.addTodo);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final titleControl = TextEditingController();
  DateTime _datepicked;

  void _submitTodo() {
    if (titleControl.text.isEmpty || _datepicked == null) return;
    widget.addTodo(titleControl.text, _datepicked);
    print(titleControl.text);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _datepicked = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Title',
          ),
          controller: titleControl,
        ),
        Container(
          height: 70,
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Text(
                _datepicked == null
                    ? 'No Date Chosen'
                    : 'Picked Date: ${DateFormat.yMd().format(_datepicked)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[850]),
              ),
              FlatButton(
                onPressed: _presentDatePicker,
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink[700],
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        RaisedButton.icon(
          onPressed: _submitTodo,
          icon: Icon(Icons.add),
          label: Text(
            'Add',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          color: Colors.red[100],
        )
      ],
    );
  }
}
